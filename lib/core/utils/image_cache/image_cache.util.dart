import 'dart:async';
import 'dart:io';

import 'package:pokemon/core/services/services_injector.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final imageCacheUtil = locator<ImageCacheUtility>();

class ImageCacheUtility {
  final BaseCacheManager? _cacheManager;

  /// Default TTL for cached files. Change as needed or pass per-call TTL.
  static const Duration defaultTtl = Duration(days: 7);

  ImageCacheUtility(this._cacheManager) : assert(_cacheManager != null);

  /// Return FileInfo if present in cache (may be stale).
  Future<FileInfo?> isFileStored(String path) async {
    return await _cacheManager?.getFileFromCache(path);
  }

  /// Returns true if file exists in cache and its last modified time is within [ttl].
  /// Uses file.lastModified() to compute age (works regardless of cache manager settings).
  Future<bool> isFileFresh(String path, {Duration? ttl}) async {
    final fileInfo = await isFileStored(path);
    if (fileInfo == null) return false;

    try {
      final file = fileInfo.file;
      final modified = await file.lastModified();
      final age = DateTime.now().difference(modified);
      return age <= (ttl ?? defaultTtl);
    } catch (_) {
      // IO errors or permission issues -> treat as not fresh
      return false;
    }
  }

  /// Start download + cache of the file and return the FileInfo when done.
  /// We return FileInfo? to indicate success (or null on failure).
  Future<FileInfo?> downloadAndCache(String url) async {
    try {
      // getSingleFile downloads and stores the file in the cache
      final File? file = await _cacheManager?.getSingleFile(url);
      // Then read FileInfo from cache
      final fileInfo = await _cacheManager?.getFileFromCache(url);
      return fileInfo;
    } catch (e) {
      // swallow network/cache errors; callers expect null if failed
      return null;
    }
  }

  /// Public helper to remove a single cache entry
  Future<void> removeSingleMediaFromCache(String key) async {
    await _cacheManager?.removeFile(key);
  }

  /// Public helper to clear full cache
  Future<void> deleteAllMediaFromCache() async {
    await _cacheManager?.emptyCache();
  }

  /// Returns an ImageProvider: FileImage if cached & fresh, otherwise NetworkImage.
  /// If not fresh/cached, this function triggers a background download (does not await it).
  Future<ImageProvider> getImageProvider(String imagePath, {Duration? ttl}) async {
    if (imagePath.isEmpty) {
      return const NetworkImage(''); // caller should handle empty URL gracefully
    }

    final fresh = await isFileFresh(imagePath, ttl: ttl);
    if (fresh) {
      final fi = await isFileStored(imagePath);
      if (fi != null) return FileImage(fi.file);
    }

    // Not fresh or not present -> start background download (fire-and-forget)
    // We intentionally do not await here, so UI can show the network image immediately.
    unawaited(downloadAndCache(imagePath));
    return NetworkImage(imagePath);
  }
}

/// Small helper to allow using `unawaited` without external pedantic dependency
// void unawaited(Future<dynamic>? f) {
//   if (f == null) return;
//   // schedule microtask so the future runs but is not awaited.
//   Future.microtask(() => f);


// class ImageCacheUtility {
//   final BaseCacheManager? _cacheManager;
//
//   ImageCacheUtility(this._cacheManager) : assert(_cacheManager != null);
//
//   Future<FileInfo?> isFileStored(String path) async {
//     final fileInfo = await _cacheManager?.getFileFromCache(path);
//     if (fileInfo == null) {
//       return null;
//     } else {
//       return fileInfo;
//     }
//   }
//
//   Future<Widget> getSingleCachedImage(String imagePath) async {
//     Widget? imageWidget;
//     if(imagePath.isNotEmpty) {
//       final fileInfo = await isFileStored(imagePath);
//       if (fileInfo == null) {
//         unawaited(_cacheManager?.downloadFile(imagePath));
//         imageWidget = NetworkImageUi(url: imagePath, showLoader: false);
//       } else {
//         imageWidget = FadeFileImageUi(file: fileInfo.file);
//       }
//     }
//     return imageWidget!;
//   }
//
//   Future<void> deleteAllMediaFromCache() async {
//     return await _cacheManager?.emptyCache();
//   }
//
//   Future<void> removeSingleMediaFromCache(String videoKey) async {
//     return await _cacheManager?.removeFile(videoKey);
//   }
// }
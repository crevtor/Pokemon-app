import 'package:flutter/widgets.dart';
import 'package:pokemon/core/utils/export.utilities.dart';

extension ImageCacheContextX on BuildContext {
  ImageCacheUtility get imageCache => imageCacheUtil;

  /// Convenience boolean to check if a file is cached.
  Future<bool> isCached(String path) async {
    final fileInfo = await imageCache.isFileStored(path);
    return fileInfo != null;
  }

  /// Remove a single key from the cache.
  Future<void> removeFromCache(String key) => imageCache.removeSingleMediaFromCache(key);

  /// Clear the whole cache.
  Future<void> clearCache() => imageCache.deleteAllMediaFromCache();

  Future<ImageProvider> getImageProvider(String url, {Duration? ttl}) {
    return imageCache.getImageProvider(url, ttl: ttl);
  }

  /// Async check if cached (fresh)
  Future<bool> isImageCachedFresh(String url, {Duration? ttl}) {
    return imageCache.isFileFresh(url, ttl: ttl);
  }
}

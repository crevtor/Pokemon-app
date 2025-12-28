import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final cacheManagerProvider = Provider<BaseCacheManager>((ref) {
  return DefaultCacheManager();
});

/// StreamProvider.family that emits FileInfo? for a given URL.
/// - Emits null for intermediate DownloadProgress events (we map to FileInfo?).
/// - Emits a FileInfo when the file is available (either cached or after download).
final imageFileStreamProvider =
StreamProvider.family<FileInfo?, String>((ref, imageUrl) {
  final cache = ref.read(cacheManagerProvider);

  // getFileStream will start the download if file isn't cached yet.
  // The stream yields events that are either DownloadProgress or FileInfo (depending on version).
  final stream = cache.getFileStream(imageUrl, withProgress: true).map<FileInfo?>((event) {
    // event types differ slightly between flutter_cache_manager versions.
    // Common types are FileInfo and DownloadProgress; we only return FileInfo.
    if (event is FileInfo) {
      return event;
    }

    // Some versions use "FileResponse" wrappers; check for a .file property:
    try {
      final dynamic e = event;
      if (e?.file != null && e is! DownloadProgress) {
        // best-effort: if it has a .file and is FileInfo-like, return a FileInfo
        // but typical cache manager implementations will give FileInfo directly.
        return e as FileInfo?;
      }
    } catch (_) {
      // ignore cast errors
    }

    // For progress events or unknown types -> yield null (consumer can show network image / loader)
    return null;
  }).distinct((p, n) {
    // avoid emitting duplicate FileInfo events with same path
    if (identical(p, n)) return true;
    if (p == null && n == null) return true;
    if (p == null || n == null) return false;
    return p.file.path == n.file.path;
  });

  return stream;
});

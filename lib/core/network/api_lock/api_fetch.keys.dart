enum ApiFetchKey {
  pokemon,
}

extension ApiFetchKeyExt on ApiFetchKey {
  String get id => 'api:$name';

  String idWith({String? param}) {
    if (param == null) return id;
    final normalized = param.toUpperCase();
    return '$id:$normalized';
  }

  /// Cache key. e.g. 'api_cache:pokemon:2301'
  String cacheKey([String? param]) {
    final p = param == null ? '' : ':${_sanitizeKeyPart(param)}';
    return 'api_cache:$name$p';
  }
}

String _sanitizeKeyPart(Object? part) {
  if (part == null) return '';
  final s = part.toString().trim();
  return s.toLowerCase().replaceAll(RegExp(r'[^a-z0-9_-]'), '_');
}
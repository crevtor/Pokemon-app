import 'package:pokemon/core/extensions/date.extensions.dart';
import 'package:flutter/foundation.dart';

enum LogLevel { info, initiate, loading, running,
  save, skip, expired,
  warn, cancel, error, success, finish, sleep }

/// Only prints in debug builds (kDebugMode).
/// Usage:
///   debugLog('ServiceName', 'Content to log');
void debugLog(String source, String message,
    {LogLevel level = LogLevel.info,
      bool printLog = true,
      bool trackLog = false,
      bool force = false}) {
  if (!kDebugMode && !force) return;

  final ts = DateTime.now();
  final src = source;
  final levelTag = _levelTag(level);

  // Compose final line(s). Keep multiline messages readable by prefixing subsequent lines.
  final lines = message.split('\n');
  final buffer = StringBuffer();
  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    if (i == 0) {
      buffer.writeln('[$levelTag] [${FormatDateUtils.getReadableDate31(ts)}] [$src] $line');
    } else {
      buffer.writeln('   ${' '.padLeft(0)} $line'); // indent follow-up lines
    }
  }

  if (kDebugMode && printLog) {
    print(buffer.toString());
  }
  if (trackLog) {
    /// Logic for tracking logs in Firebase.
  }
}


String _levelTag(LogLevel level) {
  switch (level) {
    case LogLevel.info:
      return '🔎🔎';
    case LogLevel.initiate:
      return '🚀🚀';
    case LogLevel.warn:
      return '⚠️⚠️';
    case LogLevel.cancel:
      return '🟡🟡';
    case LogLevel.error:
      return '❌❌';
    case LogLevel.loading:
      return '🔄🔄';
    case LogLevel.running:
      return '〽️〽️';
    case LogLevel.save:
      return '💾💾';
    case LogLevel.skip:
      return '🟦🟦';
    case LogLevel.expired:
      return '⌛⌛';
    case LogLevel.success:
      return '✅✅';
    case LogLevel.finish:
      return '🏁🏁';
    case LogLevel.sleep:
      return '💤💤';
  }
}
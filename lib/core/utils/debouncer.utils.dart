import 'dart:async';

class Debouncer {
  Debouncer({required this.delay});
  final Duration delay;
  Timer? _timer;

  /// Cancel any pending run.
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// Schedule [action] to run after [delay].
  /// If called again before the timer fires, the previous is cancelled.
  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}

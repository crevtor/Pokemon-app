import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Invalidate a typed FutureProvider and immediately trigger its future.
/// Returns the resolved value (rethrows any exception from the provider).
/// Use this when you have a `FutureProvider<T>` instance.
Future<T?> invalidateAndReadFuture<T>(WidgetRef ref,
    AutoDisposeFutureProvider<T> provider) async {
  // Invalidate first so provider rebuilds fresh when read.
  ref.invalidate(provider);

  // Read the provider's future and await it. This will run the provider immediately.
  // If the provider errors, the error will be thrown to the caller.
  return await ref.read(provider.future);
}

Future<T?> invalidateAndReadRefFuture<T>(Ref ref,
    AutoDisposeFutureProvider<T> provider) async {
  // Invalidate first so provider rebuilds fresh when read.
  ref.invalidate(provider);

  // Read the provider's future and await it. This will run the provider immediately.
  // If the provider errors, the error will be thrown to the caller.
  return await ref.read(provider.future);
}

/// Widget-level helper: schedule invalidate+read after first frame (common pattern).
/// Usage in useEffect: invalidateAndReadOnNextFrame(ref, myFutureProvider);
void invalidateAndReadOnNextFrame<T>(WidgetRef ref, AutoDisposeFutureProvider<T> provider) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // fire and forget intentionally — caller can `await` invalidateAndReadFuture if needed.
    // Surround with try/catch to avoid unhandled errors.
    invalidateAndReadFuture<T>(ref, provider).catchError((e, st) {
      if (kDebugMode) {
        // optional: log or handle centrally
        debugPrint('invalidateAndReadOnNextFrame: provider threw: $e\n$st');
      }
    });
  });
}

/// Optional: a small extension to make calling more ergonomic:
extension WidgetRefInvalidateReadExt on WidgetRef {
  Future<T?> invalidateAndRead<T>(AutoDisposeFutureProvider<T?> provider) =>
      invalidateAndReadFuture<T?>(this, provider);
}

extension RefInvalidateReadExt on Ref {
  Future<T?> invalidateAndRead<T>(AutoDisposeFutureProvider<T?> provider) =>
      invalidateAndReadRefFuture<T?>(this, provider);
}

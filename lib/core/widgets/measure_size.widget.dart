import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    super.key,
    required this.onChange,
    required Widget super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSizeReporter(onChange);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderSizeReporter renderObject) {
    renderObject.onChange = onChange;
  }
}

class _RenderSizeReporter extends RenderProxyBox {
  OnWidgetSizeChange onChange;
  Size? _lastSize;

  _RenderSizeReporter(this.onChange);

  @override
  void performLayout() {
    super.performLayout();
    // Only fire if the size really changed.
    if (size != _lastSize) {
      _lastSize = size;
      // Schedule the callback after this frame’s layout to avoid reentrancy.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          onChange(size);
        } catch (_) {}
      });
    }
  }
}

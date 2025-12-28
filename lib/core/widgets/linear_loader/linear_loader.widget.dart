import 'package:pokemon/core/resources/colors.res.dart';
import 'package:flutter/material.dart';

const _loadingPeriod = 700;
const _indicatorHeight = 1.5;

/// A small, self-contained linear loader.
///
/// - When [progress] is provided (0.0..1.0) the loader is determinate and shows
///   that exact progress.
/// - When [progress] is null and [isRunning] is true the loader runs an internal,
///   repeating animation (indeterminate).
/// - When [progress] is null and [isRunning] is false the loader shows nothing
///   (zero-width).
class LinearLoader extends StatefulWidget {
  const LinearLoader({
    super.key,
    this.isRunning = false,
    this.progress,
    this.backgroundColor,
    this.valueColor,
    this.showInCenter = true,
    this.height = _indicatorHeight,
    this.duration = const Duration(milliseconds: _loadingPeriod),
  });

  /// If true and [progress] is null -> start the repeating animation.
  /// If false and [progress] is null -> show nothing (resets to 0).
  final bool isRunning;

  /// Optional determinate progress 0.0..1.0. If non-null, the widget uses
  /// determinate mode (no internal animation).
  final double? progress;

  final Color? backgroundColor;
  final Animation<Color>? valueColor;

  /// If true, the filled portion grows/shrinks centered (zoom-in style).
  final bool showInCenter;

  /// Height of the bar
  final double height;

  /// Duration for a single animation cycle when running (indeterminate).
  final Duration duration;

  Color _getBackgroundColor(BuildContext context) =>
      backgroundColor ?? Colors.transparent;

  Color _getValueColor(BuildContext context) =>
      valueColor?.value ?? primary370;

  @override
  State<LinearLoader> createState() => _LinearLoaderState();
}

class _LinearLoaderState extends State<LinearLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // If initial mode is indeterminate and running -> start repeating.
    // If not running -> keep at zero by resetting.
    if (widget.progress == null && widget.isRunning) {
      _controller.repeat(reverse: true);
    } else {
      // ensure initial visual is zero (avoid lingering non-zero)
      _controller.value = 0.0;
    }
  }

  @override
  void didUpdateWidget(covariant LinearLoader oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If determinate mode now (progress provided) -> stop animation and reset.
    if (widget.progress != null) {
      if (_controller.isAnimating) {
        _controller.reset();
      } else {
        // ensure zeroed (safe)
        _controller.value = 0.0;
      }
      return;
    }

    // In indeterminate mode (progress == null) control start/stop by isRunning
    if (widget.isRunning && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!widget.isRunning && _controller.isAnimating) {
      // STOP + RESET so UI shows zero immediately rather than pausing mid-way
      _controller.reset(); // sets value to lowerBound and notifies listeners
      // force rebuild to be absolutely sure (AnimatedBuilder listens to controller anyway)
      if (mounted) setState(() {});
    }

    // If duration changed, update controller's duration and restart if necessary
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      if (widget.isRunning) {
        _controller
          ..reset()
          ..repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double animValue, TextDirection textDirection) {
    final bg = widget._getBackgroundColor(context);
    final vc = widget._getValueColor(context);

    final double widthFactor;
    if (widget.progress != null) {
      // determinate path
      widthFactor = (widget.progress!.clamp(0.0, 1.0));
    } else {
      // indeterminate path: use animation value 0..1
      widthFactor = animValue.clamp(0.0, 1.0);
    }

    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: widget.height,
      ),
      child: CustomPaint(
        painter: _LinearLoadingIndicatorPainter(
          backgroundColor: bg,
          valueColor: vc,
          widthFactor: widthFactor,
          showInCenter: widget.showInCenter,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);

    // Determinate: just build with the fixed progress value
    if (widget.progress != null) {
      return _buildIndicator(context, 0.0 /*unused*/, textDirection);
    }

    // Indeterminate: animate controller value
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // we present controller.value directly as the animation value
        return _buildIndicator(context, _controller.value, textDirection);
      },
    );
  }
}

class _LinearLoadingIndicatorPainter extends CustomPainter {
  const _LinearLoadingIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.widthFactor,
    this.showInCenter = false,
  });

  final Color backgroundColor;
  final Color valueColor;
  /// Normalized fill fraction 0..1 (already clamped)
  final double widthFactor;
  final bool showInCenter;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paintBg = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(Offset.zero & size, paintBg);

    final Paint paint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.fill;

    final double width = (widthFactor * size.width).clamp(0.0, size.width);

    if (width <= 0.0) return;

    if (showInCenter) {
      final double left = (size.width - width) / 2.0;
      canvas.drawRect(Offset(left, 0.0) & Size(width, size.height), paint);
    } else {
      canvas.drawRect(Offset(0, 0.0) & Size(width, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _LinearLoadingIndicatorPainter old) {
    return old.backgroundColor != backgroundColor ||
        old.valueColor != valueColor ||
        old.widthFactor != widthFactor ||
        old.showInCenter != showInCenter;
  }
}

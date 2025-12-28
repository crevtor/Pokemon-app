import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/material.dart';

/// A page indicator with one “pill” for the active page and circles for the others.
/// It listens to [controller.page] and animates smoothly as you scroll.
class PillDotPageIndicator extends StatefulWidget {
  /// How many pages there are.
  final int count;

  /// The PageController you’re driving your PageView with.
  final PageController controller;

  /// Color of the active “pill.”
  final Color activeColor;

  /// Color of the inactive circles.
  final Color inactiveColor;

  /// Height of both pill and dots.
  final double indicatorHeight;

  /// Width of the active pill.
  final double activeWidth;

  /// Diameter of inactive circles.
  final double inactiveSize;

  /// Space between each indicator.
  final double spacing;

  /// How quickly the transition animates.
  final Duration duration;

  const PillDotPageIndicator({
    super.key,
    required this.count,
    required this.controller,
    this.activeColor = charcoal500,
    this.inactiveColor = charcoal150,
    this.indicatorHeight = 7,
    this.activeWidth = 24,
    this.inactiveSize = 7,
    this.spacing = 6,
    this.duration = midFastDuration,
  });

  @override
  _PillDotPageIndicatorState createState() => _PillDotPageIndicatorState();
}

class _PillDotPageIndicatorState extends State<PillDotPageIndicator> {
  // current page, can be fractional while scrolling
  double _page = 0.0;
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _page = widget.controller.initialPage.toDouble();
    _listener = () {
      setState(() {
        _page = widget.controller.page ?? widget.controller.initialPage.toDouble();
      });
    };
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (i) {
        // how “selected” is this index? 1.0 = fully active, 0.0 = not active
        final distance = (_page - i).abs().clamp(0.0, 1.0);
        final t = 1.0 - distance; // t runs 1→0 as you scroll away

        // interpolate width from activeWidth→inactiveSize
        final width = widget.inactiveSize +
            (widget.activeWidth - widget.inactiveSize) * t;

        // interpolate color alpha or shade
        final color = Color.lerp(
          widget.inactiveColor,
          widget.activeColor,
          t,
        )!;

        return AnimatedContainer(
          duration: widget.duration,
          width: width,
          height: widget.indicatorHeight,
          margin: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(widget.indicatorHeight / 2),
          ),
        );
      }),
    );
  }
}

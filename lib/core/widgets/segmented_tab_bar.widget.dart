import 'package:pokemon/core/resources/export.resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef SegmentedTabCallBack = void Function(int index);

class SegmentedTabBar extends HookWidget implements PreferredSizeWidget {
  final TabController? controller;
  final List<String> labels;
  final Color unselectedColor;
  final Color selectedColor;
  final TextStyle unselectedTextStyle;
  final TextStyle selectedTextStyle;
  final double tabHeight;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry segmentPadding;
  final SegmentedTabCallBack? onSegmentSelected;

  const SegmentedTabBar({
    super.key,
    this.controller,
    required this.labels,
    required this.unselectedColor,
    required this.selectedColor,
    required this.unselectedTextStyle,
    required this.selectedTextStyle,
    this.tabHeight = 31,
    this.borderRadius = const BorderRadius.all(bigRadius100),
    this.segmentPadding = baseViewVH1012Padding,
    this.onSegmentSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Use provided controller or create an internal one
    final ctrl = controller ?? useTabController(initialLength: labels.length);

    // Track current index
    final currentIndex = useState<int>(ctrl.index);
    useEffect(() {
      void listener() => currentIndex.value = ctrl.index;
      ctrl.addListener(listener);
      return () => ctrl.removeListener(listener);
    }, [ctrl]);

    return SizedBox(
      height: tabHeight.h,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(labels.length, (index) {
          final selected = index == currentIndex.value;
          return InkWell(
            onTap: () {
              ctrl.animateTo(index);
              onSegmentSelected?.call(index);
            },
            borderRadius: borderRadius,
            child: Container(
              padding: baseViewH13Padding,
              decoration: BoxDecoration(
                color: selected ? selectedColor : unselectedColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.76),
                  topRight: Radius.circular(15.76),
                ),
                border: Border(
                  top: BorderSide(
                    color: !selected ? Colors.transparent : charcoal500,
                  ),
                  left: BorderSide(
                    color: !selected ? Colors.transparent : charcoal500,
                  ),
                  right: BorderSide(
                    color: !selected ? Colors.transparent : charcoal500,
                  ),
                )
              ),
              alignment: Alignment.center,
              child: Text(
                labels[index],
                textAlign: TextAlign.center,
                style: selected ? selectedTextStyle : unselectedTextStyle,
                textScaleFactor: 1,
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(tabHeight);
}

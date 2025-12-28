import 'dart:ui';

import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:pokemon/core/resources/colors.res.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SwipeScaffold extends ConsumerWidget {
  const SwipeScaffold({
    super.key,
    this.backgroundColor = white,
    this.startingOpacity = 1.0,
    this.useImageFilter = false,
    this.tapBackgroundToDismiss = false,
    this.safeLeft = false,
    this.safeRight = false,
    this.safeTop = false,
    this.safeBottom = false,
    this.enableWillPopScope = false,
    this.useStartingOpacity = false,
    this.onDismissed,
    this.onRefresh,
    this.refreshKey,
    this.refreshEdgeOffset = 0.0,
    this.dismissDirection = DismissiblePageDismissDirection.startToEnd,
    required this.child,
  });

  const SwipeScaffold.refresh({
    Key? key,
    Color backgroundColor = white,
    double startingOpacity = 1.0,
    bool useImageFilter = false,
    bool tapBackgroundToDismiss = false,
    bool safeLeft = false,
    bool safeRight = false,
    bool safeTop = false,
    bool safeBottom = false,
    bool enableWillPopScope = false,
    bool useStartingOpacity = false,
    VoidCallback? onDismissed,
    RefreshCallback? onRefresh,
    Key? refreshKey,
    double refreshEdgeOffset = 0.0,
    DismissiblePageDismissDirection dismissDirection = DismissiblePageDismissDirection.startToEnd,
    required Widget child,
  }) : this(
    key: key,
    backgroundColor: backgroundColor,
    startingOpacity: startingOpacity,
    useImageFilter: useImageFilter,
    tapBackgroundToDismiss: tapBackgroundToDismiss,
    safeLeft: safeLeft,
    safeRight: safeRight,
    safeTop: safeTop,
    safeBottom: safeBottom,
    enableWillPopScope: enableWillPopScope,
    useStartingOpacity: useStartingOpacity,
    onDismissed: onDismissed,
    onRefresh: onRefresh,
    refreshKey: refreshKey,
    refreshEdgeOffset: refreshEdgeOffset,
    dismissDirection: dismissDirection,
    child: child,
  );

  final Widget child;
  final Color backgroundColor;
  final double startingOpacity;
  final bool enableWillPopScope;
  final bool useImageFilter;
  final bool tapBackgroundToDismiss;
  final bool useStartingOpacity;
  final DismissiblePageDismissDirection dismissDirection;
  final bool safeLeft;
  final bool safeRight;
  final bool safeTop;
  final bool safeBottom;
  final VoidCallback? onDismissed;

  /// If not null, enable pull-to-refresh.
  final RefreshCallback? onRefresh;
  final Key? refreshKey;
  final double refreshEdgeOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget scaffoldBody = SafeArea(
      top: safeTop,
      bottom: safeBottom,
      left: safeLeft,
      right: safeRight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (useImageFilter) ...[
            Align(
              alignment: Alignment.bottomCenter,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment(0, -0.35),
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.transparent, white],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  width: double.infinity,
                  color: white,
                ),
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(),
              ),
            ),
          ],
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              child: child,
            ),
          ),
        ],
      ),
    );

    if (onRefresh != null) {
      // If caller provided a key use it; otherwise create a persistent GlobalKey.
      final Key effectiveKey = refreshKey ?? GlobalKey<RefreshIndicatorState>();

      scaffoldBody = _RefreshAwareWrapper(
        refreshKey: effectiveKey,
        edgeOffset: refreshEdgeOffset,
        onRefresh: onRefresh!,
        color: primary100,
        child: scaffoldBody,
      );
    }

    final scaffold = AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: backgroundColor,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        key: key,
        body: scaffoldBody,
      ),
    );

    final dismissible = DismissiblePage(
      onDismissed: () {
        if (onDismissed == null) {
          ref.read(routerProvider).pop();
        } else {
          onDismissed!();
        }
      },
      direction: dismissDirection,
      backgroundColor: backgroundColor,
      startingOpacity: 0,
      child: GestureDetector(
        onTap: () {
          if (tapBackgroundToDismiss) {
            ref.read(routerProvider).pop();
          }
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: scaffold,
      ),
    );

    return PopScopeUi(
      enableWillPopScope: enableWillPopScope,
      onPopResult: onDismissed,
      child: dismissible,
    );
  }
}

/// Internal widget that examines its built subtree to determine if there's any
/// descendant Scrollable. If there is a Scrollable descendant, we attach the
/// RefreshIndicator directly to the subtree (no extra wrapping). If there is no
/// Scrollable descendant, we wrap the subtree in a SingleChildScrollView with
/// AlwaysScrollableScrollPhysics so pull-to-refresh still works.
///
/// This detection runs after the first frame and updates if the widget changes.
class _RefreshAwareWrapper extends StatefulWidget {
  const _RefreshAwareWrapper({
    super.key,
    this.refreshKey,
    required this.onRefresh,
    required this.child,
    required this.color,
    this.edgeOffset = 0.0,
  });

  final Key? refreshKey;
  final RefreshCallback onRefresh;
  final Widget child;
  final Color color;
  final double edgeOffset;

  @override
  State<_RefreshAwareWrapper> createState() => _RefreshAwareWrapperState();
}

class _RefreshAwareWrapperState extends State<_RefreshAwareWrapper> {
  bool _hasScrollable = false;

  @override
  void initState() {
    super.initState();
    // Post-frame check: subtree elements are available after first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkForScrollable());
  }

  @override
  void didUpdateWidget(covariant _RefreshAwareWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-check after a new child is provided
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkForScrollable());
  }

  void _checkForScrollable() {
    bool found = false;

    void visitor(Element element) {
      // A quick heuristic: look for Scrollable widgets (ListView, SingleChildScrollView, etc.)
      if (element.widget is Scrollable) {
        found = true;
        return;
      }

      // Also consider common scrollable containers:
      final widget = element.widget;
      if (widget is ListView || widget is SingleChildScrollView || widget is CustomScrollView) {
        found = true;
        return;
      }

      element.visitChildren(visitor);
    }

    try {
      context.visitChildElements(visitor);
    } catch (_) {
      // defensively ignore traversal errors
    }

    if (mounted && found != _hasScrollable) {
      setState(() {
        _hasScrollable = found;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // If there is a Scrollable descendant, attach RefreshIndicator directly.
    // If there is no Scrollable descendant, wrap the child with a SingleChildScrollView
    // and a ConstrainedBox so the child fills the viewport and the AlwaysScrollable
    // behavior is present even when content is short.
    if (_hasScrollable) {
      return RefreshIndicator.adaptive(
        key: widget.refreshKey,
        onRefresh: widget.onRefresh,
        color: widget.color,
        edgeOffset: widget.edgeOffset,
        child: widget.child,
      );
    } else {
      // Ensure the SingleChildScrollView fills the viewport so pull-to-refresh is reachable.
      final viewportHeight = MediaQuery.sizeOf(context).height;
      return RefreshIndicator.adaptive(
        key: widget.refreshKey,
        onRefresh: widget.onRefresh,
        color: widget.color,
        edgeOffset: widget.edgeOffset,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportHeight,
            ),
            child: widget.child,
          ),
        ),
      );
    }
  }
}

/// Simple helper used elsewhere in your code (unchanged)
class TabsDimensionUi extends StatelessWidget {
  const TabsDimensionUi({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SimpleBoxUi(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      color: color,
      child: child,
    );
  }
}

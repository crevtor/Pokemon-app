import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter_animator/flutter_animator.dart';

class SplashPageUi extends ConsumerStatefulWidget {
  const SplashPageUi({super.key});

  @override
  ConsumerState<SplashPageUi> createState() => _SplashPageUiState();
}

class _SplashPageUiState extends ConsumerState<SplashPageUi>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _fade;

  bool _tweensInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: extraSlowDuration1500,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(splashLogicProvider).handleStartupLogic(context, ref);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_tweensInitialized) return;
    _tweensInitialized = true;

    // Read MediaQuery safely
    final size = MediaQuery.sizeOf(context);
    final initialScale = (size.height / size.width) + 0.2;

    _scale = Tween<double>(begin: initialScale, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );
    _fade = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SwipeScaffold(
      dismissDirection: DismissiblePageDismissDirection.none,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, _) => Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: _scale.value,
              child: CircleAvatar(
                backgroundColor: secondary450.withOpacity(_fade.value),
                radius: screenWidth,
              ),
            ),
            FadeTransition(
              opacity: _fade,
              child: Padding(
                padding: baseViewPadding119.w,
                child: FadeOutLeft(
                  preferences: AnimationPreferences(
                      offset: slowDuration,
                      duration: slowDuration,
                  ),
                  child: FadeInRight(
                    preferences: AnimationPreferences(duration: slowDuration),
                    child: RotateIn(
                      preferences: AnimationPreferences(
                          duration: slowDuration,
                      ),
                      child: Pulse(
                          preferences: AnimationPreferences(duration: slowDuration),
                          child: SmartMedia.assetSvg(pokemonBallIcon)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

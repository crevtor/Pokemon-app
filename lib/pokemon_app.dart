import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/theme/app.themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/view_models/export.view_models.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PokemonApp extends HookConsumerWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    const title = appName;
    const showDebugBanner = false;

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (screenUtilContext, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: MaterialApp.router(
              routerConfig: router,
              title: title,
              debugShowCheckedModeBanner: showDebugBanner,
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              color: primary800,
              builder: (context, child) {
                final scale = MediaQuery.textScalerOf(context).clamp(
                  minScaleFactor: 1.0, // Minimum scale factor allowed.
                  maxScaleFactor: 1.0, // Maximum scale factor allowed.
                );
                return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: scale),
                  child: ResponsiveWrapper.builder(
                    BouncingScrollWrapper.builder(context, child ?? SizedBox.shrink()),
                    minWidth: 320,
                    useShortestSide: true,
                    breakpoints: const [
                      ResponsiveBreakpoint.autoScale(350, name: MOBILE, scaleFactor: .9),
                      ResponsiveBreakpoint.autoScale(400, name: MOBILE),
                      ResponsiveBreakpoint.resize(600, name: TABLET),
                      ResponsiveBreakpoint.resize(800, name: TABLET),
                    ],
                  ),
                );
              },
            ));
        },
    );
  }
}

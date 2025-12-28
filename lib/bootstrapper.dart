import 'dart:async';

import 'package:pokemon/core/services/export.services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;

/// A wrapper class that contains methods to bootstrap the app launch.
/// For preparing the error monitoring SDKs and loading
/// up the `runApp` method in a guarded zone

class AppBootstrapper {
  const AppBootstrapper._();

  static Future<void> init({
    required Widget mainAppWidget,
    required void Function(Widget) runApp,
  }) async {

    await ServicesInjector.initializeServices();

    // For restricting the app to portrait mode only
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(mainAppWidget);
  }
}

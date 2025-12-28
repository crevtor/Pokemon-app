import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_app.dart';
import 'package:pokemon/bootstrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final mainAppWidget = ProviderScope(
    child: const PokemonApp(),
  );
  await AppBootstrapper.init(
    mainAppWidget: mainAppWidget,
    runApp: runApp,
  );
}
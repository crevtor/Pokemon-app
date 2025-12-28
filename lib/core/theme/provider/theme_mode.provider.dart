import 'package:pokemon/core/services/export.services.dart';
import 'package:pokemon/core/theme/app.themes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ThemeModeNotifier extends StateNotifier<int> {
  ThemeModeNotifier() : super(_initialModeFromDisk());

  static const themeModeKey = 'themeModeKey';

  static int _initialModeFromDisk() {
    final stored = localStorageService.getFromDisk(themeModeKey);
    if (stored is int) {
      return stored;
    } else {
      // Fallback to “light” if nothing is on disk yet
      return ThemesMode.light.modeInt;
    }
  }

  void setMode(int newMode) {
    if (newMode == state) return;
    state = newMode;
    localStorageService.saveToDisk(themeModeKey, newMode);
  }
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, int>((ref) {
  return ThemeModeNotifier();
});

/// Dark mode controlled by Theme mode state
final isDarkModeProvider = Provider<bool>((ref) {
  final modeInt = ref.watch(themeModeProvider);
  return modeInt == ThemesMode.dark.modeInt;
});

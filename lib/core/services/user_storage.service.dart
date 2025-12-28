import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/services/export.services.dart';
import 'package:hive/hive.dart';

UserStateLocalStorage get userStateStorageService => locator<UserStateLocalStorage>();

abstract class UserStateLocalStorage {
  SecondaryState getSecondaryState();
  SecondaryState updateLoginState(bool value);
  Future<void> initBox();
  void saveSecondaryState(SecondaryState secondaryState);
  void clearUserFromStorage();
}

class UserStateBoxStorage extends UserStateLocalStorage {
  Box? box;

  UserStateBoxStorage();

  @override
  SecondaryState getSecondaryState() {
    if (box == null) throw StateError('UserStateBoxStorage not initialised');
    return box?.get(HiveStorageService.stateKey,
        defaultValue: SecondaryState.empty()) ?? SecondaryState.empty();
  }

  @override
  Future<void> initBox() async {
    // Ensure the box is open — if not, open it
    if (!Hive.isBoxOpen(HiveStorageService.stateKey)) {
      await Hive.openBox(HiveStorageService.stateKey);
    }

    box = Hive.box(HiveStorageService.stateKey);
  }

  @override
  SecondaryState updateLoginState(bool value) {
    final s = getSecondaryState();
    final updated = s.copyWith(isLoggedIn: value);
    saveSecondaryState(updated);
    return updated;
  }

  @override
  void saveSecondaryState(SecondaryState secondaryState) {
    if (box == null) throw StateError('UserStateBoxStorage not initialised');
    box?.put(HiveStorageService.stateKey, secondaryState);
  }

  @override
  void clearUserFromStorage() async {
    localStorageService.empty();
    box?.put(HiveStorageService.stateKey, SecondaryState.empty());
  }
}

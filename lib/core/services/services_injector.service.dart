import 'package:pokemon/core/services/export.services.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked_services/stacked_services.dart' as stacked_service;

GetIt locator = GetIt.instance;

class ServicesInjector {
  ServicesInjector._();

  static Future<void> initializeServices() async {
    locator.registerLazySingleton(() => stacked_service.NavigationService());
    locator.registerLazySingleton(() => stacked_service.DialogService());

    var lsInstance = await LocalStorageService.getInstance();
    locator.registerSingleton<LocalStorageService>(lsInstance);

    final hiveService = HiveStorageService();
    await hiveService.init();
    await hiveService.clearData();
    locator.registerSingleton<HiveStorageService>(hiveService);

    final userStorage = UserStateBoxStorage();
    await userStorage.initBox();
    locator.registerSingleton<UserStateLocalStorage>(userStorage);
  }
}
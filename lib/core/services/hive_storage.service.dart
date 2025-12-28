import 'package:pokemon/core/models/export.models.dart';
import 'package:pokemon/core/services/export.services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveTypeConstant {
  static const secondaryState = 1;
}

HiveStorageService get hiveStorageService => locator<HiveStorageService>();

class HiveStorageService {
  factory HiveStorageService() => _instance;
  static final HiveStorageService _instance = HiveStorageService._internal();
  static const storageCount = 1;
  static const stateDB = "stateDB";

  HiveStorageService._internal();

  static const _storageKEY = 'storage_key_$storageCount';
  static final stateKey = '$stateDB$storageCount';

  Box<dynamic>? _storageBox;

  Future<void> init() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(SecondaryStateAdapter());

    await Future.wait([
      Hive.openBox(HiveStorageService.stateKey),
    ]);

    _storageBox = await Hive.openBox(_storageKEY);
  }

  Future<void> clearData() async {
    await _storageBox?.clear();
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/utils/app_errors.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../models/settings_entity.dart';
import '../objectbox.g.dart';

abstract class SettingsDataStorage {
  Future<Either<SettingsModel, AppError>> load();
  Future<Either<SettingsModel, AppError>> saveSettings(
      {required SettingsModel settings});
}

@Named("SettingsDataStorageImpl")
@Injectable(as: SettingsDataStorage)
class SettingsDataStorageImpl implements SettingsDataStorage {
  SettingsDataStorageImpl._create(this.store) {
    _box = store.box<SettingsEntity>();
  }
  late final Store store;
  late final Box<SettingsEntity> _box;
  @override
  Future<Either<SettingsModel, AppError>> load() async {
    final settings = _box.get(1);
    if (settings == null) {
      final value = await saveSettings(settings: SettingsModel.initial());
      return value;
    } else {
      return Left(settings.toModel());
    }
  }

  @override
  Future<Either<SettingsModel, AppError>> saveSettings(
      {required SettingsModel settings}) async {
    final response = await _box
        .putAndGetAsync(SettingsEntity.fromSettings(settings: settings));
    return Left(response.toModel());
  }

  @factoryMethod
  static Future<SettingsDataStorage> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "settings"));
    return SettingsDataStorageImpl._create(store);
  }
}

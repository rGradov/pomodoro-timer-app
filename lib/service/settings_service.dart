import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/utils/app_errors.dart';

import '../data_storage/settings_data_storage.dart';

abstract class SettingsService {
  Future<Either<SettingsModel, AppError>> load();
  Future<Either<SettingsModel, AppError>> save({required SettingsModel settings});
}

@Named("SettingsServiceImpl")
@Injectable(as: SettingsService)
class SettingServiceImpl implements SettingsService {
  SettingServiceImpl(@Named("SettingsDataStorageImpl") this._storage);
  final SettingsDataStorage _storage;
  @override
  Future<Either<SettingsModel, AppError>> load() async {
    final settings = await _storage.load();
    return settings;
  }

  @override
  Future<Either<SettingsModel, AppError>> save({required SettingsModel settings}) async{
    final savedSettings = await _storage.saveSettings(settings: settings);
    return savedSettings;
  }
}

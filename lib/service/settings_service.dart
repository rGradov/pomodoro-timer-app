import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/src/settings/app_settings.dart';
import 'package:pomodoro/utils/app_errors.dart';
import 'package:rxdart/rxdart.dart';

import '../data_storage/settings_data_storage.dart';
import '../utils/app_export.dart';

abstract interface class SettingsService {
  Future<Either<SettingsModel, AppError>> save(
      {required SettingsModel settings});
  PublishSubject<SettingsModel> get subject;
}

@Named("SettingsServiceImpl")
@Injectable(as: SettingsService)
class SettingServiceImpl implements SettingsService {
  SettingServiceImpl(
      @Named("SettingsDataStorageImpl") this._storage, this._manager);
  final SettingsDataStorage _storage;
  final SettingsManager _manager;
  @override
  PublishSubject<SettingsModel> get subject => _manager.subject;
  @PostConstruct()
  Future<Either<SettingsModel, AppError>> load() async {
    debugPrint("start post construct");
    final settings = await _storage.load();
    settings.fold((s) {
      _manager.addSettings(s);
      debugPrint("add settings to settings manager");
    }, (r) => {debugPrint(r.toString())});
    return settings;
  }

  @override
  Future<Either<SettingsModel, AppError>> save(
      {required SettingsModel settings}) async {
    final savedSettings = await _storage.saveSettings(settings: settings);
    if (savedSettings.isLeft()) {
      _manager.addSettings(settings);
    }
    return savedSettings;
  }
}

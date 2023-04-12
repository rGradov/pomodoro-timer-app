import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/service/app_service.dart';
import 'package:pomodoro/utils/app_export.dart';
import 'package:pomodoro/utils/app_structures.dart' as custom;

import '../models/time_period_model.dart';
import '../service/settings_service.dart';

class MainVm extends ChangeNotifier {
  MainVm() {
    init();
  }
  SettingsModel? settings;
  Future<void> init() async {
    _service = locator.get(instanceName: "AppServiceImpl");
    _settingsService =
        await locator.getAsync(instanceName: "SettingsServiceImpl");
    await loadConfig();
  }

  Future<void> loadConfig() async {
    final settingResponse = await _settingsService.load();
    settingResponse.fold((l) {
      settings = l;
    }, (r) {
      debugPrint(r.text);
    });
    final response = await _service.loadConfiguration(
        settings: settings ?? SettingsModel.initial());
    response.fold((l) {
      debugPrint(l.text);
    }, (r) {
      _data = r;
    });
    _current = _data?.head;
    notifyListeners();
  }

  custom.Node<TimePeriod>? _current;
  TimePeriod? get current => _current?.value;

  late final AppService _service;
  late final SettingsService _settingsService;
  custom.LinkedList<TimePeriod>? _data;

  void moveNext() {
    _current = _current?.next;
    notifyListeners();
  }
}

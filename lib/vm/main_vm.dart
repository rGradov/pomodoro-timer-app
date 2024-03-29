import 'dart:async';

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

  Timer? _timer;
  SettingsModel? settings;

  Stream<Duration> get stream => _controller.stream;

  Future<void> init() async {
    _controller = StreamController();
    _service = await locator.getAsync(instanceName: "ProxyAppServiceImpl");
    _settingsService =
        await locator.getAsync(instanceName: "SettingsServiceImpl");
    await loadConfig();
  }

  late final StreamController<Duration> _controller;

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
    _controller.add(current!.time);
  }

  custom.Node<TimePeriod>? _current;

  TimePeriod? get current => _current?.value;

  late final AppService _service;
  late final SettingsService _settingsService;
  custom.LinkedList<TimePeriod>? _data;

  void moveNext() {
    _current = _current?.next;
    _controller.add(_current!.value.time);
    notifyListeners();
  }

  void onPlayButtonClick() {
    _run();
  }

  Future<void> _run() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_current == null) {
        _timer?.cancel();
      } else {
        final duration = _current!.value.time - const Duration(seconds: 1);
        if (duration == Duration.zero) {
          _timer!.cancel();
          moveNext();
        }
        _current =
            _current!.copyWith(value: _current!.value.copyWith(duration));
        _controller.add(_current!.value.time);
      }
    });
  }
}

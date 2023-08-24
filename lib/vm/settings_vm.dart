import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/service/settings_service.dart';
import '../utils/app_utils.dart';

typedef ToggleCallback = Function(bool value);

@injectable
class SettingsVm extends StateProvider<SettingsModel> {
  SettingsVm(@Named("SettingsServiceImpl") this._service)
      : super(SettingsModel.initial()) {
    init();
  }
  StreamSubscription<SettingsModel>? _subscription;
  final SettingsService _service;
  Future<void> init() async {
    _service.subject.listen((value) {
      debugPrint("settings server:$value");
      state = value;
    });
  }

  Future<void> toggleSound(bool value) async {
    final settings =
        await _service.save(settings: state.copyWith(sound: value));
    settings.fold((l) {
      state = l;
    }, (r) {
      debugPrint(r.text);
    });
  }

  Future<void> toggleDarkMode(bool value) async {
    final settings =
        await _service.save(settings: state.copyWith(darkMode: value));
    settings.fold((l) {
      state = l;
    }, (r) {
      debugPrint(r.text);
    });
  }

  Future<void> toggleNotification(bool value) async {
    final settings =
        await _service.save(settings: state.copyWith(notification: value));
    settings.fold((l) {
      state = l;
    }, (r) {
      debugPrint(r.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}

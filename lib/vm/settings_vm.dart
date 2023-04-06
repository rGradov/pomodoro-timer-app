import 'package:flutter/foundation.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/utils/statistic_delegate.dart';

import '../utils/app_utils.dart';

typedef ToggleCallback = Function(bool value);

class SettingsVm extends StateProvider<SettingsModel> {
  SettingsVm([StatisticDelegate? delegate])
      : _delegate = delegate,
        super(SettingsModel.initial());
  final StatisticDelegate? _delegate;

  void toggleSound(bool value) {
    state = state.copyWith(sound: value);
    _delegate?.trackSettings(settings: state);
  }

  void toggleDarkMode(bool value) {
    state = state.copyWith(darkMode: value);
    _delegate?.trackSettings(settings: state);
  }

  void toggleNotification(bool value) {
    state = state.copyWith(notification: value);
    _delegate?.trackSettings(settings: state);
  }
}

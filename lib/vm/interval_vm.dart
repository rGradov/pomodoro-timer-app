import 'package:flutter/cupertino.dart';
import 'package:pomodoro/service/settings_service.dart';
import 'package:pomodoro/utils/app_export.dart';
import 'package:pomodoro/utils/app_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/interval_model.dart';

typedef IntervalCallback = bool Function(IntervalModel);

/// FIXME: refactor me
class IntervalVm extends StateProvider<List<IntervalModel>>
    with FindActiveInterval {
  IntervalVm({required IntervalType type})
      : _type = type,
        super(type.getValues()) {
    init();
  }
  late final SettingsService service;
  final IntervalType _type;
  Future<void> init() async {
    service = await locator.getAsync<SettingsService>(
        instanceName: "SettingsServiceImpl");
    final settings = await service.load();
    settings.fold((l) async {
      /// FIXME: refactor me
      switch (_type) {
        case IntervalType.focus:
          state = findActive(
              type: _type, callback: (elem) => elem.value == l.focusTime);
          break;
        case IntervalType.longBreak:
          state = findActive(
              type: _type, callback: (elem) => elem.value == l.longBreakTime);
          break;
        case IntervalType.shortBreak:
          state = findActive(
              type: _type, callback: (elem) => elem.value == l.breakTime);
          break;
        case IntervalType.pomodoro:
          state = findActive(
              type: _type, callback: (elem) => elem.value == l.focusTime);
          break;
        case IntervalType.language:
          state = [
            LanguageIntervalModel(value: "EN"),
            LanguageIntervalModel(value: "Ru"),
          ];
          break;
      }
    }, (r) {
      debugPrint(r.text);
    });
  }

  Future<void> select(int id) async {
    state = state.map((e) => e.copyWith(isSelected: false)).toList();
    final selected = state[id].copyWith(isSelected: !state[id].isSelected);
    state = List.from(state
      ..removeAt(id)
      ..insert(id, selected));
    debugPrint(state.toString());
    if (_type == IntervalType.language) {
      await AppLocalizations.delegate.load(Locale("ru"));
    }
    // _saveSettings();
    notifyListeners();
  }

  /// FIXME: refactor me
  Future<void> _saveSettings() async {
    final settings = await service.load();
    settings.fold((l) async {
      if (_type == IntervalType.longBreak) {
        await service.save(
            settings: l.copyWith(
                longBreakTime:
                    state.firstWhere((element) => element.isSelected).value));
        return;
      }
      if (_type == IntervalType.shortBreak) {
        await service.save(
            settings: l.copyWith(
                breakTime:
                    state.firstWhere((element) => element.isSelected).value));
        return;
      }
      await service.save(
          settings: l.copyWith(
              focusTime:
                  state.firstWhere((element) => element.isSelected).value));
    }, (r) {
      debugPrint(r.text);
    });
  }
}

mixin FindActiveInterval {
  List<IntervalModel> findActive({
    required IntervalType type,
    required IntervalCallback callback,
  }) {
    final values = type.getValues();
    final index = values.indexWhere(callback);
    final active = values[index];
    return List.from(values
      ..removeAt(index)
      ..insert(index, active));
  }
}

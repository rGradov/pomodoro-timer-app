import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/service/settings_service.dart';
import 'package:pomodoro/utils/app_utils.dart';

import '../models/interval_model.dart';

typedef IntervalCallback = bool Function(IntervalModel);

@injectable
class IntervalVm extends StateProvider<List<IntervalModel>>
    with FindActiveInterval {
  IntervalVm({@Named("SettingsServiceImpl") required this.service})
      : super(IntervalType.focus.getValues());
  final SettingsService service;
  final IntervalType _type = IntervalType.focus;
  Future<void> init() async {
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
    notifyListeners();
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

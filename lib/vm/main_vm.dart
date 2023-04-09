import 'package:appmetrica_push_plugin/appmetrica_push_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:pomodoro/service/app_service.dart';
import 'package:pomodoro/utils/app_structures.dart' as custom;
import 'package:pomodoro/utils/statistic_delegate.dart';

import '../models/time_period_model.dart';

class MainVm extends ChangeNotifier {
  MainVm() : _service = AppServiceImpl(AppMetricaDelegate()) {
    init();
  }
  Future<void> init() async {
    final response = await _service.loadConfiguration();
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

  final AppService _service;
  custom.LinkedList<TimePeriod>? _data;

  void moveNext() {
    _current = _current?.next;
    notifyListeners();
  }
}

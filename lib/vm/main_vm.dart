import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/service/app_service.dart';
import 'package:pomodoro/utils/app_structures.dart' as custom;

import '../models/time_period_model.dart';
@injectable
class MainVm extends ChangeNotifier {
  MainVm(@Named("AppServiceImpl") this._service) {
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

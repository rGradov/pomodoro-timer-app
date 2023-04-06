import 'package:fpdart/fpdart.dart';
import 'package:pomodoro/models/time_period_model.dart';

import '../utils/app_errors.dart';
import '../utils/app_structures.dart' as custom;

typedef Success = custom.LinkedList<TimePeriod>;

abstract class AppService {
  Future<Either<AppError, Success>> loadConfiguration();
}

class AppServiceImpl implements AppService {
  @override
  Future<Either<AppError, Success>> loadConfiguration() async {
    final list = custom.LinkedList<TimePeriod>()
      ..append(const FocusTimePeriod(time: Duration(minutes: 25)))
      ..append(const ShortBreak(time: Duration(minutes: 5)))
      ..append(const FocusTimePeriod(time: Duration(minutes: 25)))
      ..append(const LongBreak(time: Duration(minutes: 10)));
    list.tail?.next = list.head;
    return Either<AppError, Success>.of(list);
  }
}

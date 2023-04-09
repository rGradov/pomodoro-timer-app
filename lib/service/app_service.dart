import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/statistic_event_model.dart';
import 'package:pomodoro/models/time_period_model.dart';

import '../utils/app_errors.dart';
import '../utils/app_structures.dart' as custom;
import '../utils/statistic_delegate.dart';

typedef Success = custom.LinkedList<TimePeriod>;
abstract class AppService {
  Future<Either<AppError, Success>> loadConfiguration();
}
@Named("AppServiceImpl")
@Injectable(as: AppService)
class AppServiceImpl implements AppService {
  AppServiceImpl(@Named("AppMetricaDelegate") this._delegate){
    _delegate.init();
  }
  final StatisticDelegate _delegate;
  @override
  Future<Either<AppError, Success>> loadConfiguration() async {
    final list = custom.LinkedList<TimePeriod>()
      ..append(const FocusTimePeriod(time: Duration(minutes: 25)))
      ..append(const ShortBreak(time: Duration(minutes: 5)))
      ..append(const FocusTimePeriod(time: Duration(minutes: 25)))
      ..append(const LongBreak(time: Duration(minutes: 10)));
    list.tail?.next = list.head;
    await _delegate.trackEvent(event: StatisticEvent(time: DateTime.now(), event: "load configuration"));
    return Either<AppError, Success>.of(list);
  }
}

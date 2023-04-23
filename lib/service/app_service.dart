import 'package:fpdart/fpdart.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/models/time_period_model.dart';
import '../utils/app_export.dart';
import '../utils/app_structures.dart' as custom;

typedef Success = custom.LinkedList<TimePeriod>;

abstract class AppService {
  Future<Either<AppError, Success>> loadConfiguration(
      {required SettingsModel settings});
}

@Named("AppServiceImpl")
@Injectable(as: AppService)
class AppServiceImpl implements AppService {
  AppServiceImpl(@Named("AppMetricaDelegate") this._delegate);
  final StatisticDelegate _delegate;
  @override
  Future<Either<AppError, Success>> loadConfiguration(
      {required SettingsModel settings}) async {
    final list = custom.LinkedList<TimePeriod>()
      ..append(FocusTimePeriod(time: Duration(minutes: settings.focusTime)))
      ..append(ShortBreak(time: Duration(minutes: settings.breakTime)))
      ..append(FocusTimePeriod(time: Duration(minutes: settings.focusTime)))
      ..append(LongBreak(time: Duration(minutes: settings.longBreakTime)));

    list.tail?.next = list.head;
    await _delegate.trackEvent(eventName: "load configuration");
    return Either<AppError, Success>.of(list);
  }
}

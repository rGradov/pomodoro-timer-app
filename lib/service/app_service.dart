import 'package:fpdart/fpdart.dart';
import 'package:pomodoro/models/settings_model.dart';
import 'package:pomodoro/models/time_period_model.dart';
import '../utils/app_export.dart';
import '../utils/app_structures.dart' as custom;

typedef Success = custom.LinkedList<TimePeriod>;

abstract interface class AppService {
  Future<Either<AppError, Success>> loadConfiguration(
      {required SettingsModel settings});
}

@Named("AppServiceImpl")
class AppServiceImpl implements AppService {
  AppServiceImpl();
  @override
  Future<Either<AppError, Success>> loadConfiguration(
      {required SettingsModel settings}) async {
    debugPrint(settings.toString());
    final list = custom.LinkedList<TimePeriod>()
      ..append(FocusTimePeriod(time: Duration(minutes: settings.focusTime)))
      ..append(ShortBreak(time: Duration(minutes: settings.breakTime)))
      ..append(FocusTimePeriod(time: Duration(minutes: settings.focusTime)))
      ..append(LongBreak(time: Duration(minutes: settings.longBreakTime)));

    list.tail?.next = list.head;

    return Either<AppError, Success>.of(list);
  }
}

@Named("ProxyAppServiceImpl")
@Injectable(as: AppService)
class ProxyAppServiceImpl implements AppService {
  ProxyAppServiceImpl(@Named("AppMetricaDelegate") this._delegate);
  final StatisticDelegate _delegate;

  AppServiceImpl? _sub;
  AppServiceImpl get _subject {
    _sub ??= AppServiceImpl();
    return _sub!;
  }

  @override
  Future<Either<AppError, Success>> loadConfiguration(
      {required SettingsModel settings}) async {
    await _delegate.trackEvent(eventName: "start load configuration");
    final response = await _subject.loadConfiguration(settings: settings);
    await _delegate.trackEvent(
        eventName: "settings are ${settings.toString()}");
    return response;
  }
}

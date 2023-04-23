import 'package:pomodoro/utils/env.dart';

import 'app_export.dart';

abstract class StatisticDelegate {
  Future<void> init();
  Future<void> trackEvent({required String eventName});
  Future<void> reportEventWithMap({required Tracked event});
}

@Named("AppMetricaDelegate")
@Singleton(as: StatisticDelegate)
class AppMetricaDelegate implements StatisticDelegate {
  @override
  @PostConstruct()
  Future<void> init() async =>
      await AppMetrica.activate(AppMetricaConfig(Env.metrica));

  @override
  Future<void> trackEvent({required String eventName}) async {
    await AppMetrica.reportEvent(eventName);
    return;
  }

  @override
  Future<void> reportEventWithMap(
      {String? name, required Tracked event}) async {
    await AppMetrica.reportEventWithMap(name ?? "event", event.toTrack());
  }
}

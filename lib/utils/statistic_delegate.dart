import 'package:appmetrica_plugin/appmetrica_plugin.dart';

import '../models/statistic_event_model.dart';

abstract class StatisticDelegate {
  Future<void> init();
  Future<void> trackEvent({required StatisticEvent event});
}

class AppMetricaDelegate implements StatisticDelegate {
  @override
  Future<void> init() async {
    AppMetrica.activate(
        const AppMetricaConfig("d20ed232-8c07-432e-97fb-7598955da1eb"));
  }

  @override
  Future<void> trackEvent({required StatisticEvent event}) async {
    await AppMetrica.reportEvent(event.toMetrica());
    return;
  }
}

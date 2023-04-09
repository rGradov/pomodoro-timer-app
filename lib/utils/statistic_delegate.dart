import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:appmetrica_push_plugin/appmetrica_push_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/models/settings_model.dart';

import '../models/statistic_event_model.dart';

abstract class StatisticDelegate {
  Future<void> init();
  Future<void> trackEvent({required StatisticEvent event});
  Future<void> trackSettings({required SettingsModel settings});
}

@Named("AppMetricaDelegate")
@Singleton(as: StatisticDelegate)
class AppMetricaDelegate implements StatisticDelegate {
  @override
  Future<void> init() async {
    AppMetrica.activate(
        const AppMetricaConfig("d20ed232-8c07-432e-97fb-7598955da1eb"));
    AppMetricaPush.activate();
    AppMetricaPush.tokenStream.listen((tokens) {
      debugPrint(tokens.toString());
    });
  }

  @override
  Future<void> trackEvent({required StatisticEvent event}) async {
    await AppMetrica.reportEvent(event.toMetrica());
    return;
  }

  @override
  Future<void> trackSettings({required SettingsModel settings}) async {
    await AppMetrica.reportEvent(settings.toMetrica());
  }
}

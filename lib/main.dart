import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pomodoro/navigation/app_navigation.dart';
import 'package:pomodoro/utils/statistic_delegate.dart';
import 'package:pomodoro/vm/main_vm.dart';
import 'package:pomodoro/vm/settings_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainVm>(
          create: (_) => MainVm(),
          lazy: false,
        ),
        ChangeNotifierProvider<SettingsVm>(
          create: (_) => SettingsVm(AppMetricaDelegate()),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.select((MainVm vm) => vm.current);
    final theme = context.select((SettingsVm vm) =>vm.state);
    return MaterialApp.router(
      key: navigatorKey,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: current?.theme ?? ThemeData(),
      themeMode: theme.mode,
      darkTheme: current?.darkTheme ?? ThemeData.dark(),
    );
  }
}

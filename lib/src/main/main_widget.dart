part of "app_main.dart";

class AppMain extends ElementaryWidget<MainWm> {
  const AppMain({Key? key}) : super(createMainWm, key: key);

  @override
  Widget build(MainWm wm) {
    return ValueListenableBuilder<SettingsModel>(
        valueListenable: wm.settings,
        builder: (_, value, __) {
          debugPrint("app main ${value.toString()}");
          return MaterialApp.router(
            key: navigatorKey,
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(useMaterial3: true),
            themeMode: value.mode,
            darkTheme: ThemeData.dark(useMaterial3: true),
          );
        });
  }
}

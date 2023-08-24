part of "app_home.dart";

class HomeWm extends WidgetModel<HomeScreen, HomeModel> {
  HomeWm(HomeModel model) : super(model);
  ValueListenable<TimePeriod?> get period => model.period;
  Color get backgroundColor =>
      period.value?.theme.scaffoldBackgroundColor ??
      Theme.of(context).scaffoldBackgroundColor;
  Color get cardColor =>
      period.value?.theme.cardColor ?? Theme.of(context).cardColor;
  Color get canvasColor =>
      period.value?.theme.canvasColor ?? Theme.of(context).canvasColor;
  Color get dividerColor =>
      period.value?.theme.dividerColor ?? Theme.of(context).dividerColor;
  Color get indicatorColor =>
      period.value?.theme.indicatorColor ?? Theme.of(context).indicatorColor;

  TextStyle? get mediumStyle => Theme.of(context).textTheme.displayMedium;

  void onNextButtonTap() => model.next();
  @override
  void dispose() {
    super.dispose();
    model.dispose();
  }

  void onSettingsButtonTap() async {
    await context.push<bool>("/settings");
  }
}

HomeWm createHomeWm(BuildContext _) => HomeWm(home);

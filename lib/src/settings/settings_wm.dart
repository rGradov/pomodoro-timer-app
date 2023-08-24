part of "app_settings.dart";

class SettingsWM
    extends LocalizationModel<SettingsScreen, ElementarySettingsModel> {
  SettingsWM(ElementarySettingsModel model) : super(model);

  ValueListenable<SettingsModel> get settings => model._settings;
  Color get backgroundColor => Theme.of(context).scaffoldBackgroundColor;
  TextStyle get doneStyle => Theme.of(context).textTheme.labelMedium!;

  void onBackButtonClick() => context.pop(true);
  void onToggleDarkModeClick(bool value) {}
  void onToggleSoundClick(bool value) {}
  void onToggleNotificationClick(bool value) {}
}

SettingsWM createSettingsWm(BuildContext _) => SettingsWM(settingsModel);

/// FIXME: extract me also
/// TODO:create COLOR & localization Model
class LocalizationModel<W extends ElementaryWidget, M extends ElementaryModel>
    extends WidgetModel<W, M> {
  LocalizationModel(super.model);
  String get settingsHeader => AppLocalizations.of(context)!.settings;
  String get doneText => AppLocalizations.of(context)!.done;
  String get pomodoroText => AppLocalizations.of(context)!.pomodoro;
  String get general => AppLocalizations.of(context)!.general;
  String get darkMode => AppLocalizations.of(context)!.darkMode;
  String get sound => AppLocalizations.of(context)!.sound;
  String get notification => AppLocalizations.of(context)!.notification;
  String get language => AppLocalizations.of(context)!.language;
}

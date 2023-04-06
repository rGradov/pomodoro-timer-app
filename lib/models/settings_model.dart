class SettingsModel {
  const SettingsModel(
      {required this.darkMode,
      required this.notification,
      required this.sound});
  final bool darkMode;
  final bool sound;
  final bool notification;

  @override
  String toString() =>
      "Settings(darkMode:$darkMode,notification:$notification,sound:$sound)";
}

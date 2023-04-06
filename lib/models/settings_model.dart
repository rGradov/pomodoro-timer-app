import 'package:flutter/material.dart';
import 'package:pomodoro/utils/app_utils.dart';

class SettingsModel implements Copyable<SettingsModel> {
  const SettingsModel(
      {required this.darkMode,
      required this.notification,
      required this.sound});
  final bool darkMode;
  final bool sound;
  final bool notification;
  ThemeMode get mode => darkMode ? ThemeMode.dark : ThemeMode.light;
  factory SettingsModel.initial() {
    return const SettingsModel(
        darkMode: false, notification: true, sound: true);
  }
  @override
  String toString() =>
      "Settings(darkMode:$darkMode,notification:$notification,sound:$sound)";

  @override
  SettingsModel copy() => SettingsModel(
      darkMode: darkMode, notification: notification, sound: sound);

  @override
  SettingsModel copyWith({bool? darkMode, bool? notification, bool? sound}) =>
      SettingsModel(
          darkMode: darkMode ?? this.darkMode,
          notification: notification ?? this.notification,
          sound: sound ?? this.sound);
}

extension OnSettingsModel on SettingsModel {
  String toMetrica() =>
      "darkMode:${_boolToString(darkMode)},notification: ${_boolToString(notification)},sound:${_boolToString(sound)}";
  String _boolToString(bool value) => value ? "enable" : "disable";
}

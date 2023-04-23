import 'package:flutter/material.dart';
import 'package:pomodoro/models/settings_entity.dart';
import 'package:pomodoro/utils/app_utils.dart';

class SettingsModel implements Copyable<SettingsModel>, Tracked {
  const SettingsModel({
    required this.darkMode,
    required this.notification,
    required this.sound,
    this.breakTime = 5,
    this.focusTime = 25,
    this.longBreakTime = 10,
  });
  final bool darkMode;
  final bool sound;
  final bool notification;
  final int breakTime;
  final int focusTime;
  final int longBreakTime;
  ThemeMode get mode => darkMode ? ThemeMode.dark : ThemeMode.light;
  factory SettingsModel.initial() {
    return const SettingsModel(
        darkMode: false, notification: true, sound: true);
  }
  @override
  String toString() =>
      "Settings(darkMode:$darkMode,notification:$notification,sound:$sound,focus time:$focusTime,long break time:$longBreakTime,short break time: $breakTime)";
  @override
  bool operator ==(Object other) {
    return other is SettingsModel &&
        darkMode == other.darkMode &&
        sound == other.sound &&
        longBreakTime == other.longBreakTime &&
        focusTime == other.focusTime &&
        breakTime == other.breakTime &&
        notification == other.notification;
  }

  @override
  int get hashCode =>
      darkMode.hashCode ^
      notification.hashCode ^
      sound.hashCode ^
      longBreakTime.hashCode & focusTime.hashCode & breakTime.hashCode;
  @override
  SettingsModel copy() => SettingsModel(
      darkMode: darkMode,
      notification: notification,
      sound: sound,
      breakTime: breakTime,
      focusTime: focusTime,
      longBreakTime: longBreakTime);

  @override
  SettingsModel copyWith(
          {bool? darkMode,
          bool? notification,
          bool? sound,
          int? longBreakTime,
          int? breakTime,
          int? focusTime}) =>
      SettingsModel(
          darkMode: darkMode ?? this.darkMode,
          notification: notification ?? this.notification,
          sound: sound ?? this.sound,
          longBreakTime: longBreakTime ?? this.longBreakTime,
          breakTime: breakTime ?? this.breakTime,
          focusTime: focusTime ?? this.focusTime);

  @override
  Map<String, Object> toTrack() => {
        "darkMode": darkMode,
        "notification": notification,
        "sound": sound,
        "time": DateTime.now(),
      };
}

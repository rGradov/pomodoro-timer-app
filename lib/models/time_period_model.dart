import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/models/sound_model.dart';

class TimePeriod {
  const TimePeriod({
    required this.time,
    required this.name,
    required this.icon,
    required this.size,
    required this.sounds,
  });
  final Duration time;
  final String name;
  final String icon;
  final Size size;
  final SoundModel sounds;
  ThemeData get theme => ThemeData();
  ThemeData get darkTheme => ThemeData.dark();
}

class FocusTimePeriod extends TimePeriod {
  const FocusTimePeriod({required Duration time})
      : super(
            name: "Focus",
            time: time,
            sounds: const SoundModel(
                end: "assets/sounds/start.m4a",
                start: "assets/sounds/start.m4a"),
            icon: "assets/icons/brain.svg",
            size: const Size(120, 50));
  void func() {
    ThemeData.dark();
  }

  @override
  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF2F2),
        primaryColor: const Color(0xFFFFF2F2),
        cardColor: const Color(0xFFFFD9D9),
        canvasColor: const Color(0xFF471515),
        indicatorColor: const Color(0xFF471515),
        highlightColor: const Color(0xFFFF4C4C).withOpacity(0.71),
        dividerColor: const Color(0xFFFFD9D9),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
              color: Color(0xFF471515),
              fontFamily: "RobotoFlex",
              fontSize: 212),
          displayMedium: const TextStyle(
              color: Color(0xFF471515), fontFamily: "RobotoFlex", fontSize: 24),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontFamily: "RobotoFlex",
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF4C4C).withOpacity(0.71),
          ),
          labelMedium: const TextStyle(
            fontSize: 18,
            fontFamily: "RobotoFlex",
            fontWeight: FontWeight.bold,
            color: Color(0xFF471515),
          ),
        ),
      );
  @override
  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0D0404),
        primaryColor: const Color(0xFFFFF2F2),
        cardColor: const Color(0xFF310E0E),
        canvasColor: const Color(0xFFFFF2F2),
        indicatorColor: const Color(0xFFFFD9D9),
        highlightColor: const Color(0xFFFF4C4C).withOpacity(0.71),
        dividerColor: const Color(0xFF310E0E),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
              color: Color(0xFFFFF2F2),
              fontFamily: "RobotoFlex",
              fontSize: 212),
          displayMedium: const TextStyle(
              color: Color(0xFFFFF2F2), fontFamily: "RobotoFlex", fontSize: 24),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontFamily: "RobotoFlex",
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF4C4C).withOpacity(0.71),
          ),
          labelMedium: const TextStyle(
            fontSize: 18,
            fontFamily: "RobotoFlex",
            fontWeight: FontWeight.bold,
            color: Color(0xFF471515),
          ),
        ),
      );
}

class LongBreak extends TimePeriod {
  const LongBreak({required Duration time})
      : super(
            name: "Long break",
            time: time,
            sounds: const SoundModel(
                end: "assets/sounds/long_break_end.m4a",
                start: "assets/sounds/long_break_start.m4a"),
            icon: "assets/icons/coffee.svg",
            size: const Size(180, 50));
  @override
  ThemeData get theme => ThemeData(
      primaryColor: const Color(0xFFF2F9FF),
      scaffoldBackgroundColor:  const Color(0xFFF2F9FF),
      cardColor: const Color(0xFFD9EEFF),
      canvasColor: const Color(0xFF153047),
      highlightColor: const Color(0xFF4CACFF).withOpacity(0.62),
      dividerColor: const Color(0xFFD9EEFF),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            color: Color(0xFF153047), fontFamily: "RobotoFlex", fontSize: 212),
        displayMedium: const TextStyle(
            color: Color(0xFF153047), fontFamily: "RobotoFlex", fontSize: 24),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: "RobotoFlex",
          fontWeight: FontWeight.bold,
          color: const Color(0xFF4CACFF).withOpacity(0.62),
        ),
        labelMedium: const TextStyle(
          fontSize: 18,
          fontFamily: "RobotoFlex",
          fontWeight: FontWeight.bold,
          color: Color(0xFF153047),
        ),
      ));
}

class ShortBreak extends TimePeriod {
  const ShortBreak({required Duration time})
      : super(
            name: "Short break",
            time: time,
            sounds: const SoundModel(
                end: "assets/sounds/short_break_end.m4a",
                start: "assets/sounds/short_break_start.m4a"),
            icon: "assets/icons/coffee.svg",
            size: const Size(180, 50));
  @override
  ThemeData get theme => ThemeData(
      primaryColor: const Color(0xFFF2FFF5),
      scaffoldBackgroundColor:  const Color(0xFFF2FFF5),

      cardColor: const Color(0xFFDAFAE0),
      canvasColor: const Color(0xFF14401D),
      highlightColor: const Color(0xFF4DDA6E).withOpacity(0.62),
      dividerColor: const Color(0xFFDAFAE0),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            color: Color(0xFF14401D), fontFamily: "RobotoFlex", fontSize: 212),
        displayMedium: const TextStyle(
            color: Color(0xFF14401D), fontFamily: "RobotoFlex", fontSize: 24),
        labelMedium: const TextStyle(
          fontSize: 18,
          fontFamily: "RobotoFlex",
          fontWeight: FontWeight.bold,
          color: Color(0xFF14401D),
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: "RobotoFlex",
          fontWeight: FontWeight.bold,
          color: const Color(0xFF4DDA6E).withOpacity(0.62),
        ),
      ));
}

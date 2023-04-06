import 'package:flutter/material.dart';

String formatDuration(Duration? duration) {
  if (duration == null) {
    return "";
  }
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  return "$minutes\n$seconds";
}

/// main thing which help easily mange the state of Vm
abstract class StateProvider<T> extends ChangeNotifier {
  T _state;
  T get state => _state;
  set state(T value) {
    if (value != _state) {
      _state = value;
      notifyListeners();
    }
  }

  StateProvider(T initState) : _state = initState;
}

abstract class Copyable<T> {
  T copy();
  T copyWith();
}

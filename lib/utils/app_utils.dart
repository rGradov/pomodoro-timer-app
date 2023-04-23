import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../vm/settings_vm.dart';
import 'app_export.dart';
import '../models/interval_model.dart';

enum IntervalType { focus, longBreak, shortBreak, pomodoro }

/// FIXME: create solve issue with async settings
Future<SettingsVm> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final settings = await locator.getAsync<SettingsVm>();
  return settings;
}

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

abstract class Tracked {
  Map<String, Object> toTrack();
}

extension IntervalTypes on IntervalType {
  List<IntervalModel> getValues() {
    switch (this) {
      case IntervalType.focus:
        return [
          TimeIntervalModel(value: 15),
          TimeIntervalModel(value: 25),
          TimeIntervalModel(value: 30),
          TimeIntervalModel(value: 50)
        ];
      case IntervalType.longBreak:
        return [
          TimeIntervalModel(value: 15),
          TimeIntervalModel(value: 20),
          TimeIntervalModel(value: 25),
        ];
      case IntervalType.shortBreak:
        return [
          TimeIntervalModel(value: 5),
          TimeIntervalModel(value: 10),
          TimeIntervalModel(value: 15),
        ];
      case IntervalType.pomodoro:
        return [
          CountIntervalModel(value: 2),
          CountIntervalModel(value: 3),
          CountIntervalModel(value: 4),
          CountIntervalModel(value: 5),
        ];
    }
  }

  void markActive(VoidCallback callback) {
    switch (this) {
      case IntervalType.focus:
        callback();
        break;
      case IntervalType.longBreak:
        // TODO: Handle this case.
        break;
      case IntervalType.shortBreak:
        // TODO: Handle this case.
        break;
      case IntervalType.pomodoro:
        // TODO: Handle this case.
        break;
    }
  }
}

String intToTimeLeft(int value) {
  int h, m, s;
  h = value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();
  String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();
  return "$minuteLeft:$secondsLeft";
}

import 'dart:ui';

import 'package:pomodoro/utils/app_utils.dart';

class IntervalModel<T> implements Copyable<IntervalModel>, Tracked {
  IntervalModel({required this.value, this.measure, this.isSelected = false});
  final T value;
  final String? measure;
  final bool isSelected;

  @override
  // TODO: implement hashCode
  int get hashCode => value.hashCode ^ measure.hashCode ^ isSelected.hashCode;

  @override
  String toString() =>
      "$runtimeType(value:$value,measure:$measure,isSelected:$isSelected,)";

  @override
  IntervalModel copy() =>
      IntervalModel(value: value, measure: measure, isSelected: isSelected);

  @override
  IntervalModel copyWith({int? value, String? measure, bool? isSelected}) =>
      IntervalModel(
          value: value ?? this.value,
          measure: measure ?? this.measure,
          isSelected: isSelected ?? this.isSelected);

  @override
  bool operator ==(Object other) {
    return other is IntervalModel &&
        other.value == value &&
        other.measure == measure &&
        other.isSelected == isSelected;
  }

  @override
  Map<String, Object> toTrack() => {
        "type": runtimeType,
        "value": value.toString(),
        "measure": measure ?? "",
        "isSelected": isSelected,
        "time": DateTime.now(),
      };
}

class TimeIntervalModel extends IntervalModel<int> {
  TimeIntervalModel({required int value}) : super(value: value, measure: "min");
}

class CountIntervalModel extends IntervalModel<int> {
  CountIntervalModel({required int value}) : super(value: value);
}

class LanguageIntervalModel extends IntervalModel<String> {
  LanguageIntervalModel({required String value})
      : super(value: value, measure: null);
  
  Locale get locale => value =="En"?const Locale("en"):const Locale("ru");
}

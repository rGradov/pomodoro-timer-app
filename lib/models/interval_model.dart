import 'package:pomodoro/utils/app_utils.dart';

class IntervalModel implements Copyable<IntervalModel> {
  IntervalModel({required this.value, this.measure, this.isSelected = false});
  final int value;
  final String? measure;
  final bool isSelected;

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
}

class TimeIntervalModel extends IntervalModel {
  TimeIntervalModel({required int value}) : super(value: value, measure: "min");
}

class CountIntervalModel extends IntervalModel {
  CountIntervalModel({required int value}) : super(value: value);
}

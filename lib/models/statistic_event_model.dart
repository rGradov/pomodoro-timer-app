class StatisticEvent {
  const StatisticEvent({required this.time, required this.event});
  final DateTime time;
  final String event;
}

extension YandexMetrica on StatisticEvent {
  String toMetrica() => "${time.toString()}: $event";
}

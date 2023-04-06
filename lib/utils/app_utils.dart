String formatDuration(Duration? duration) {
  if (duration == null) {
    return "";
  }
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  return "$minutes\n$seconds";
}

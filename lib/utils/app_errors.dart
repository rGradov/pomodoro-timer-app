class AppError extends Error {
  AppError({this.text = "error"});
  final String text;
  @override
  String toString() => text;
}

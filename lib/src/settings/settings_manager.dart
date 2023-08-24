part of "app_settings.dart";

@singleton
final class SettingsManager {
  late final _subject = PublishSubject<SettingsModel>();
  PublishSubject<SettingsModel> get subject => _subject;
  void addSettings(SettingsModel settings) {
    _subject.add(settings);
  }

  Future<void> close() async {
    _subject.close();
  }
}

part of "app_settings.dart";

@injectable
class ElementarySettingsModel extends ElementaryModel {
  ElementarySettingsModel(
      @Named("SettingsServiceImpl") this._settingsService, this._manager);
  final SettingsService _settingsService;
  final SettingsManager _manager;
  late final ValueNotifier<SettingsModel> _settings =
      ValueNotifier(SettingsModel.initial());

  @override
  void init() {
    super.init();
    _loadSettings();
  }

  Future<void> _loadSettings() async {

  }


  void toggleSound() {
  }
}

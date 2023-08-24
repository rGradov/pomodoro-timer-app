part of "app_settings.dart";

@injectable
class ElementarySettingsModel extends ElementaryModel {
  ElementarySettingsModel(
      @Named("SettingsServiceImpl") this._settingsService,);
  final SettingsService _settingsService;
  late final ValueNotifier<SettingsModel> _settings =
      ValueNotifier(SettingsModel.initial());
  StreamSubscription<SettingsModel>? _subscription;
  ValueListenable<SettingsModel> get settings =>_settings;

  @override
  void init() {
    super.init();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _subscription = _settingsService.subject.listen((settings) {
      _settings.value = settings.copy();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  void toggleSound() {}
}

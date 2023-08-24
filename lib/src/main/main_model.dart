part of "app_main.dart";

@injectable
class ElementaryMainModel extends ElementaryModel {
  ElementaryMainModel(@Named("SettingsServiceImpl") this._settingsService);
  final SettingsService _settingsService;
  late final ValueNotifier<SettingsModel> _settings =
      ValueNotifier(SettingsModel.initial());
  ValueListenable<SettingsModel> get settings =>_settings;
  StreamSubscription<SettingsModel>? _subscription;

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
}

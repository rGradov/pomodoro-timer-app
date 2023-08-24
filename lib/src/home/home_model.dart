part of 'app_home.dart';

@injectable
class HomeModel extends ElementaryModel {
  HomeModel(@Named("ProxyAppServiceImpl") this._service,
      @Named("SettingsServiceImpl") this._settingsService);
  final AppService _service;
  final SettingsService _settingsService;
  Node<TimePeriod>? _current;
  late final ValueNotifier<TimePeriod?> period = ValueNotifier(null);

  @override
  Future<void> init() async {
    final settingsResponse = await _settingsService.load();
    settingsResponse.fold((settings) async {
      final configurationResponse =
          await _service.loadConfiguration(settings: settings);
      configurationResponse.fold((err) {
        debugPrint(err.text);
      }, (periodList) {
        _current = periodList.head;
        period.value = _current?.value;
      });
    }, (err) {
      debugPrint(err.text);
    });
  }

  void next() {
    _current = _current?.next;
    period.value = _current!.value;
  }
}

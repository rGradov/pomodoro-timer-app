part of 'app_home.dart';

@injectable
class HomeModel extends ElementaryModel {
  HomeModel(@Named("ProxyAppServiceImpl") this._service,
      @Named("SettingsServiceImpl") this._settingsService);
  final AppService _service;
  final SettingsService _settingsService;
  StreamSubscription<SettingsModel>? _subscription;
  Node<TimePeriod>? _current;
  late final ValueNotifier<TimePeriod?> period = ValueNotifier(null);

  @override
  Future<void> init() async {
    _subscription = _settingsService.subject.listen((settings) async {
      debugPrint("HomeModel:$settings");
      final configurationResponse =
          await _service.loadConfiguration(settings: settings);
      configurationResponse.fold((err) {
        debugPrint(err.text);
      }, (periodList) {
        _current = periodList.head;
        period.value = _current?.value;
      });
    });
  }

  void next() {
    _current = _current?.next;
    period.value = _current!.value;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

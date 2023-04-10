import 'app_export.dart';

/// this is the configuration for injectable and service locator
final GetIt locator = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => locator.init();
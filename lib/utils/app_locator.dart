import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pomodoro/utils/app_locator.config.dart';

final GetIt locator = GetIt.instance;
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => locator.init();
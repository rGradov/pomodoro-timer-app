import 'package:envied/envied.dart';
part 'env.g.dart';
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'METRICA',obfuscate: true)
  static final String metrica = _Env.metrica;
}
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

/// after configuring DI done, then do build runner
/// https://pub.dev/packages/build_runner
/// terminal line : flutter pub run build_runner build --delete-conflicting-outputs
/// flutter DI tutorial
/// https://www.sandromaglione.com/techblog/how_to_implement_dependecy_injection_in_flutter

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

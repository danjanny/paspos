import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/data_sources/i_user_data_source.dart';
import 'package:paspos/module/domain/repositories/i_user_repository.dart';
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(ignoreUnregisteredTypes: [
  IUserDataSource,
  IUserRepository,
  IUserLoginUseCase
])
void configureDependencies() => getIt.init();

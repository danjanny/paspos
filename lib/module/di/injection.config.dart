// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:paspos/module/data/data_sources/i_user_data_source.dart' as _i3;
import 'package:paspos/module/data/data_sources/user_data_source.dart' as _i4;
import 'package:paspos/module/data/repositories/user_new_repository.dart'
    as _i8;
import 'package:paspos/module/domain/repositories/i_user_repository.dart'
    as _i7;
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart'
    as _i5;
import 'package:paspos/module/domain/use_cases/user_login_use_case.dart' as _i6;
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IUserDataSource>(() => _i4.UserDataSource());
    gh.factory<_i5.IUserLoginUseCase>(
        () => _i6.UserLoginUseCase(gh<_i7.IUserRepository>()));
    gh.factory<_i7.IUserRepository>(
        () => _i8.UserNewRepository(gh<_i3.IUserDataSource>()));
    gh.factory<_i9.LoginCubit>(
        () => _i9.LoginCubit(gh<_i5.IUserLoginUseCase>()));
    return this;
  }
}

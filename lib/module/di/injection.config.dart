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
import 'package:paspos/module/data/data_sources/i_product_data_source.dart'
    as _i7;
import 'package:paspos/module/data/data_sources/i_user_data_source.dart'
    as _i10;
import 'package:paspos/module/data/data_sources/product_data_source.dart'
    as _i8;
import 'package:paspos/module/data/data_sources/user_data_source.dart' as _i11;
import 'package:paspos/module/data/repositories/product_repository.dart' as _i9;
import 'package:paspos/module/data/repositories/user_new_repository.dart'
    as _i15;
import 'package:paspos/module/domain/repositories/i_product_repository.dart'
    as _i6;
import 'package:paspos/module/domain/repositories/i_user_repository.dart'
    as _i14;
import 'package:paspos/module/domain/use_cases/get_product_use_case.dart'
    as _i5;
import 'package:paspos/module/domain/use_cases/i_get_product_use_case.dart'
    as _i4;
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart'
    as _i12;
import 'package:paspos/module/domain/use_cases/user_login_form_use_case.dart'
    as _i13;
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_cubit.dart'
    as _i3;
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart'
    as _i16;

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
    gh.factory<_i3.FetchProductCubit>(() => _i3.FetchProductCubit(
          getProductUseCase: gh<_i4.IGetProductUseCase>(),
          qetProductUseCase: gh<_i4.IGetProductUseCase>(),
        ));
    gh.factory<_i4.IGetProductUseCase>(
        () => _i5.GetProductUseCase(gh<_i6.IProductRepository>()));
    gh.factory<_i7.IProductDataSource>(() => _i8.ProductDataSource());
    gh.factory<_i6.IProductRepository>(
        () => _i9.ProductRepository(gh<_i7.IProductDataSource>()));
    gh.factory<_i10.IUserDataSource>(() => _i11.UserDataSource());
    gh.factory<_i12.IUserLoginUseCase>(
        () => _i13.UserLoginFormUseCase(gh<_i14.IUserRepository>()));
    gh.factory<_i14.IUserRepository>(
        () => _i15.UserNewRepository(gh<_i10.IUserDataSource>()));
    gh.factory<_i16.LoginCubit>(
        () => _i16.LoginCubit(gh<_i12.IUserLoginUseCase>()));
    return this;
  }
}

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
    as _i8;
import 'package:paspos/module/data/data_sources/i_user_data_source.dart'
    as _i11;
import 'package:paspos/module/data/data_sources/product_data_source.dart'
    as _i9;
import 'package:paspos/module/data/data_sources/user_data_source.dart' as _i12;
import 'package:paspos/module/data/repositories/product_repository.dart'
    as _i10;
import 'package:paspos/module/data/repositories/user_new_repository.dart'
    as _i16;
import 'package:paspos/module/domain/repositories/i_product_repository.dart'
    as _i7;
import 'package:paspos/module/domain/repositories/i_user_repository.dart'
    as _i15;
import 'package:paspos/module/domain/use_cases/get_product_use_case.dart'
    as _i6;
import 'package:paspos/module/domain/use_cases/i_get_product_use_case.dart'
    as _i4;
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart'
    as _i13;
import 'package:paspos/module/domain/use_cases/user_login_form_use_case.dart'
    as _i14;
import 'package:paspos/module/presentation/manager/fetch_detail_product_cubit/fetch_detail_product_cubit.dart'
    as _i3;
import 'package:paspos/module/presentation/manager/fetch_product_cubit/fetch_product_cubit.dart'
    as _i5;
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart'
    as _i17;

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
    gh.factory<_i3.FetchDetailProductCubit>(() => _i3.FetchDetailProductCubit(
        getProductUseCase: gh<_i4.IGetProductUseCase>()));
    gh.factory<_i5.FetchProductCubit>(() => _i5.FetchProductCubit(
          getProductUseCase: gh<_i4.IGetProductUseCase>(),
          qetProductUseCase: gh<_i4.IGetProductUseCase>(),
        ));
    gh.factory<_i4.IGetProductUseCase>(
        () => _i6.GetProductUseCase(gh<_i7.IProductRepository>()));
    gh.factory<_i8.IProductDataSource>(() => _i9.ProductDataSource());
    gh.factory<_i7.IProductRepository>(
        () => _i10.ProductRepository(gh<_i8.IProductDataSource>()));
    gh.factory<_i11.IUserDataSource>(() => _i12.UserDataSource());
    gh.factory<_i13.IUserLoginUseCase>(
        () => _i14.UserLoginFormUseCase(gh<_i15.IUserRepository>()));
    gh.factory<_i15.IUserRepository>(
        () => _i16.UserNewRepository(gh<_i11.IUserDataSource>()));
    gh.factory<_i17.LoginCubit>(
        () => _i17.LoginCubit(gh<_i13.IUserLoginUseCase>()));
    return this;
  }
}

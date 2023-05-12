import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/data/data_sources/i_user_data_source.dart';
import 'package:paspos/module/di/injection.dart';
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_state.dart';
import 'package:paspos/paspos_app.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'module/utils/viewport_util.dart';

void main() {
  QR.setUrlStrategy();

  configureDependencies();
  IUserLoginUseCase? userLoginUseCase = getIt<IUserLoginUseCase>();
  var blocWidget = MultiBlocProvider(
      providers: [BlocProvider(create: (ctx) => LoginCubit(userLoginUseCase))],
      child: const PasposApp());
  runApp(blocWidget);
}

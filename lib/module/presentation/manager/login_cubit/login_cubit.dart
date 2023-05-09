import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/domain/entities/user.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_state.dart';
import 'package:paspos/module/utils/global_util.dart';

class LoginCubit extends Cubit<LoginState> {
  int counter = 0;

  static get initialState => InitialLoginState();

  LoginCubit() : super(initialState);

  void submit(Map<String, dynamic> submitParams) {
    logSystem((LoginCubit()).toString(), "login submit params",
        jsonEncode(submitParams));
    emit(LoadedLoginState(
        user: User(
      id: "1",
      username: submitParams['username'],
      password: submitParams['password'],
      phoneNumber: "085817535079",
    )));
  }
}

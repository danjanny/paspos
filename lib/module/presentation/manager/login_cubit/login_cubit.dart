import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/data/models/user_model.dart';
import 'package:paspos/module/domain/entities/user.dart';
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_state.dart';
import 'package:http/http.dart' as http;
import 'package:paspos/module/utils/global_util.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  IUserLoginUseCase? userLoginUseCase;

  LoginCubit(this.userLoginUseCase) : super(InitialLoginState());

  void submit(Map<String, dynamic> submitParams) async {
    emit(LoadingLoginState());

    try {
      http.Response? response = await userLoginUseCase?.getUser(submitParams);

      logSystem((LoginCubit(userLoginUseCase)).toString(), "body resp",
          response!.body);

      if (response.statusCode == 200) {
        emit(
            LoadedLoginState(user: User(id: '1', phoneNumber: '085817535079')));
      } else if (response.statusCode == 403) {
        emit(const InvalidUserLoginState(
            responseMessage: "Incorrect username or password"));
      } else if (response.statusCode == 401) {
        submit(submitParams);
      } else {
        emit(const GeneralErrorLoginState(responseMessage: "General Error"));
      }
    } on http.ClientException catch (e) {
      emit(OfflineLoginState());
    } on TimeoutException catch (e) {
      emit(TimeoutLoginState());
    } catch (e) {
      emit(const GeneralErrorLoginState(responseMessage: "General Error"));
    }
  }
}

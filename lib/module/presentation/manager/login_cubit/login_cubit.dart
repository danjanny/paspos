import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:paspos/module/domain/use_cases/i_user_login_use_case.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_state.dart';
import 'package:http/http.dart' as http;

@injectable
class LoginCubit extends Cubit<LoginState> {
  IUserLoginUseCase? userLoginUseCase;

  LoginCubit(this.userLoginUseCase) : super(InitialLoginState());

  void submit(Map<String, dynamic> submitParams) async {
    emit(LoadingLoginState());
    http.Response? response = await userLoginUseCase?.getUser(submitParams);

    if (response?.statusCode == 200) {
      emit(LoadedLoginState());
    } else {
      emit(GeneralErrorLoginState());
    }
  }
}

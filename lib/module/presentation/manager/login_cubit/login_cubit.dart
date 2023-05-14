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
    http.Response? response = await userLoginUseCase?.getUser(submitParams);
    logSystem(
        (LoginCubit(userLoginUseCase)).toString(), "body resp", response!.body);

    emit(LoadedLoginState(user: User(id: '1', phoneNumber: '085817535079')));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/domain/entities/user.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  int counter = 0;

  static get initialState => InitialLoginState();

  LoginCubit() : super(initialState);

  void submit() {
    counter++;
    emit(LoadedLoginState(
        user: User(
            id: counter.toString(),
            phoneNumber: "085817535079",
            username: "danjanny")));
  }
}

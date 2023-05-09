import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';
import 'package:paspos/module/presentation/widgets/login_page/login_page_form_widget.dart';
import 'package:paspos/module/utils/global_util.dart';
import '../manager/login_cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PasposMainView(
              mainView: BlocListener<LoginCubit, LoginState>(
        listener: (ctx, state) {
          if (state is LoadedLoginState) {
            var user = state.user.toString();
            logSystem((LoginPage()).toString(), "login page", user);
          }
        },
        child: LoginPageFormWidget(
          onSubmit: (Map<String, dynamic> submitParams) {
            context.read<LoginCubit>().submit(submitParams);
          },
        ),
      ))),
    );
  }
}

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
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PasposMainView(
              mainView: BlocListener<LoginCubit, LoginState>(
        listener: (ctx, state) {
          if (state is LoadingLoginState) {
            var currentWidth = MediaQuery.of(context).size.width;
            var remainingWidth = currentWidth - 375;

            showDialog(
                context: ctx,
                builder: (BuildContext dialogCtx) {
                  return AlertDialog(
                    insetPadding: EdgeInsets.fromLTRB(
                        (remainingWidth / 2) + 125.0,
                        10.0,
                        (remainingWidth / 2) + 125.0,
                        10.0),
                    content: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      width: 50,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator(strokeWidth: 1.0)],
                      ),
                    ),
                  );
                });
          }

          if (state is LoadedLoginState) {
            Navigator.pop(ctx);
            var user = state.user!;
            showDialog(
                context: ctx,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    content: Text(user.phoneNumber!),
                  );
                });
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

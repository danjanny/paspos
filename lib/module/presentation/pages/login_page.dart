import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart';
import 'package:paspos/module/presentation/pages/paspos_main_view.dart';
import 'package:paspos/module/presentation/widgets/bottom_sheet/bottom_sheet_launcher.dart';
import 'package:paspos/module/presentation/widgets/bottom_sheet/general_bottom_sheet_widget.dart';
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
      body: Stack(
        children: [
          Image.asset("assets/images/error.png", width: 1, height: 1),
          Image.asset("assets/images/offline.png", width: 1, height: 1),
          Center(
              child: PasposMainView(
                  mainView: BlocListener<LoginCubit, LoginState>(
            listener: (ctx, state) {
              if (state is LoadingLoginState) {
                var currentWidth = MediaQuery.of(context).size.width;
                var remainingWidth = currentWidth - 375;

                showDialog(
                    context: ctx,
                    builder: (BuildContext dialogCtx) {
                      return Dialog(
                        insetPadding: EdgeInsets.fromLTRB(
                            (remainingWidth / 2) + 125.0,
                            30.0,
                            (remainingWidth / 2) + 125.0,
                            30.0),
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        //this right here
                        child: const SizedBox(
                          height: 75,
                          width: 50,
                          child: Center(
                              child: SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 1.0))),
                        ),
                      );
                    });
              }

              if (state is InvalidUserLoginState) {
                Navigator.pop(ctx);
                var responseMessage = state.responseMessage;
                BottomSheetLauncher.show(
                    ctx,
                    GeneralBottomSheetWidget(
                      imagePath: 'assets/images/error.png',
                      title: "Error",
                      subtitle: responseMessage,
                      buttonTitle: "OK",
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                    ));
              }

              if (state is GeneralErrorLoginState) {
                Navigator.pop(ctx);
                var responseMessage = state.responseMessage;
                BottomSheetLauncher.show(
                    ctx,
                    GeneralBottomSheetWidget(
                      imagePath: 'assets/images/error.png',
                      title: "General Error",
                      subtitle: responseMessage,
                      buttonTitle: "OK",
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                    ));
              }

              if (state is TimeoutLoginState) {
                Navigator.pop(ctx);
                BottomSheetLauncher.show(
                    ctx,
                    GeneralBottomSheetWidget(
                      imagePath: 'assets/images/offline.png',
                      title: "Timeout",
                      subtitle: "Silakan mencoba kembali beberapa saat lagi",
                      buttonTitle: "OK",
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                    ));
              }

              if (state is OfflineLoginState) {
                Navigator.pop(ctx);
                BottomSheetLauncher.show(
                    ctx,
                    GeneralBottomSheetWidget(
                      imagePath: 'assets/images/offline.png',
                      title: "Offline",
                      subtitle: "Cek Koneksi Internet Anda",
                      buttonTitle: "OK",
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                    ));
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
          )))
        ],
      ),
    );
  }
}

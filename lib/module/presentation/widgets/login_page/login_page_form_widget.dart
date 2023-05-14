import 'package:flutter/material.dart';
import 'package:paspos/module/presentation/widgets/login_page/header_wording_widget.dart';
import 'package:paspos/module/presentation/widgets/login_page/login_form_widget.dart';
import 'package:paspos/module/utils/colors.dart';
import 'package:paspos/module/utils/config.dart';

import '../../../utils/dimension.dart';

class LoginPageFormWidget extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSubmit;

  LoginPageFormWidget({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<LoginPageFormWidget> createState() => _LoginPageFormWidgetState();
}

class _LoginPageFormWidgetState extends State<LoginPageFormWidget> {
  final _loginFormKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWordingWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LoginFormWidget(
                  controller: _usernameController,
                  errorValidationMessage: "Username harus diisi",
                  hintText: "Username"),
              const SizedBox(height: 14.0),
              LoginFormWidget(
                obscureText: !_passwordVisible,
                controller: _passwordController,
                errorValidationMessage: "Password harus diisi",
                hintText: "Password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                        !_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 14.0)),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimension.formBorderRadius)),
                    backgroundColor: PasposColor.themeColor,
                    minimumSize: const Size.fromHeight(55.0)),
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    Map<String, dynamic> params = {
                      'username': _usernameController.text,
                      'password': _passwordController.text
                    };
                    return widget.onSubmit(params);
                  }
                },
                child: Text('Login',
                    style: TextStyle(
                        fontFamily: PasposConfig.fontFamily,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimension.buttonTextFontSize))),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Don't have account ? Login Now",
                style: TextStyle(
                    fontFamily: PasposConfig.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimension.loginFooterWording)),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:paspos/module/utils/colors.dart';

import '../../utils/viewport_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var viewportUtil = ViewportUtil.getLimitMaxWidthHeight(
        context, 375.0, PasposColor.borderColor);

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: viewportUtil.edgeBorderColor!)),
          constraints: BoxConstraints(
              maxHeight: viewportUtil.maxHeight!,
              maxWidth: viewportUtil.maxWidth),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Page asdasdasdasdas'),
              Text('Login Page asdasdasdasdas')
            ],
          ),
        ),
      ),
    );
  }
}

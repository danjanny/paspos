import 'package:flutter/material.dart';
import 'package:paspos/module/utils/config.dart';
import 'package:paspos/module/utils/dimension.dart';

class HeaderWordingWidget extends StatelessWidget {
  const HeaderWordingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back',
            style: TextStyle(
                fontFamily: PasposConfig.fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: Dimension.loginHeadline)),
        SizedBox(height: 12.0),
        Text(
            'I am so happy to see. You can continue to login for manage your finance',
            style: TextStyle(
                fontFamily: PasposConfig.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: Dimension.loginSubheadline))
      ],
    );
  }
}

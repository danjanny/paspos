import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class SubmitCheckoutWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? textWidget;
  final double? height;

  const SubmitCheckoutWidget(
      {super.key, this.backgroundColor, this.textWidget, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
            color: backgroundColor ?? PasposColor.themeColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 3.0, offset: Offset(0, 0))
            ]),
        height: height ?? 50.0,
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: textWidget ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Rp 1.200.000,-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 40),
                            backgroundColor: Colors.deepOrange),
                        onPressed: () {},
                        child: Text('Checkout',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  )
                ],
              ),
        ));
  }
}

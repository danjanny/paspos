import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AddToCartWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? textWidget;
  final double? height;

  const AddToCartWidget(
      {super.key, this.backgroundColor, this.textWidget, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: backgroundColor ?? PasposColor.themeColor,
      height: height ?? 50.0,
      child: textWidget ??
          const Text('Add to Cart',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}

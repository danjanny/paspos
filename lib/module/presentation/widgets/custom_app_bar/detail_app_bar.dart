import 'package:flutter/material.dart';

import '../../../utils/config.dart';

class DetailAppBar extends StatelessWidget {
  final Widget? leadingIcon;
  final Color? color;
  final double? height;
  final Color? textColor;
  final Text? widgetText;
  final IconButton? prefixIcon;

  const DetailAppBar(
      {super.key,
      this.leadingIcon,
      this.color,
      this.height,
      this.textColor,
      this.widgetText,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? PasposConfig.themeColor,
      height: height ?? 70.0,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          leadingIcon ??
              CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.white70,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20.0,
                    )),
              ),
          const SizedBox(width: 20.0),
          widgetText ?? Container(),
          prefixIcon ?? Container()
        ],
      ),
    );
  }
}

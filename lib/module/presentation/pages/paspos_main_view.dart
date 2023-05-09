import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/viewport_util.dart';

class PasposMainView extends StatelessWidget {
  final Widget? mainView;

  const PasposMainView({Key? key, required this.mainView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewportUtil = ViewportUtil.getLimitMaxWidthHeight(
        context, 375.0, PasposColor.borderColor);

    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: viewportUtil.edgeBorderColor!)),
        constraints: BoxConstraints(
            maxHeight: viewportUtil.maxHeight!,
            maxWidth: viewportUtil.maxWidth),
        child: mainView,
      ),
    ));
  }
}

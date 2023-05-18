import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/viewport_util.dart';

class BottomSheetLauncher {
  static void show(BuildContext context, Widget mainContent) {
    var viewportUtil = ViewportUtil.getLimitMaxWidthHeight(
        context, 375.0, PasposColor.borderColor);

    showModalBottomSheet(
        constraints: BoxConstraints(maxWidth: viewportUtil.maxWidth),
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        context: context,
        builder: (ctx) {
          return mainContent;
        });
  }
}

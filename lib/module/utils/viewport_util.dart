import 'package:flutter/material.dart';

/// Manage limit width and height of viewport
class ViewportUtil {
  static double mobileMaxHeight = 915;

  Color? edgeBorderColor;
  double maxWidth;
  double? maxHeight;

  ViewportUtil.getMaxWidthHeight(
      this.edgeBorderColor, this.maxWidth, this.maxHeight);

  /// get limit max width & max height
  static ViewportUtil getLimitMaxWidthHeight(
      BuildContext context, double maxWidth, Color borderColor) {
    var currentHeight = MediaQuery.of(context).size.height;
    var currentWidth = MediaQuery.of(context).size.width;

    // if tablet, ipad -> use current width, else 375
    double? maxHeight;
    double? usedMaxWidth;

    if (currentWidth <= 912) {
      usedMaxWidth =
          currentWidth; // max width using current width for tablet & ipad
      maxHeight = currentHeight; // max height desktop limit to current height
    } else {
      usedMaxWidth = maxWidth; // max width desktop and under tablet
      maxHeight = mobileMaxHeight; // max height desktop limit to 915
    }

    return ViewportUtil.getMaxWidthHeight(borderColor, usedMaxWidth, maxHeight);
  }
}

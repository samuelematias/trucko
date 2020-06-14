import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';

class CustomProgressIndicator extends SizedBox {
  CustomProgressIndicator({
    double width = 30.0,
    double height = 30.0,
    double strokeWidth = 2.0,
    Color backgroundColor = ColorPalette.white50,
    Color valueColor = ColorPalette.green50,
  }) : super(
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            strokeWidth: strokeWidth,
          ),
          width: width,
          height: height,
        );
}

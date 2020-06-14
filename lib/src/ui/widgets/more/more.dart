library more;

import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';

class More extends StatelessWidget {
  final String count;
  final double widthBorderImage;
  final Color borderColor;
  final double width;
  final double height;

  const More({
    Key key,
    this.count = '',
    this.width = 48.0,
    this.height = 48.0,
    this.widthBorderImage = 2.0,
    this.borderColor = ColorPalette.grey400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: widthBorderImage),
        ),
        child: Text(
          '+$count',
          textAlign: TextAlign.center,
        ).p2(fontSize: 12, color: ColorPalette.grey100),
      );
}

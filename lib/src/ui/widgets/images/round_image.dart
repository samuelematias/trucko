import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/theme/theme.dart';

class RoundImage extends StatelessWidget {
  final String image;
  final double widthBorderImage;
  final Color borderColor;
  final double width;
  final double height;

  const RoundImage({
    Key key,
    this.image,
    this.width = 48.0,
    this.height = 48.0,
    this.widthBorderImage = 2.0,
    this.borderColor = ColorPalette.grey400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: widthBorderImage),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              image ?? imgTrucko,
            ),
          ),
        ),
      );
}

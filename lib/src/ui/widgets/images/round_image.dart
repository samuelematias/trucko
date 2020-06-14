import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/theme/theme.dart';

class RoundImage extends StatelessWidget {
  final String imageUrl;
  final double widthBorderImage;
  final Color borderColor;
  final double width;
  final double height;
  final bool showBadge;

  const RoundImage({
    Key key,
    this.imageUrl = '',
    this.width = 48.0,
    this.height = 48.0,
    this.widthBorderImage = 2.0,
    this.borderColor = ColorPalette.grey400,
    this.showBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: widthBorderImage),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: imageUrl.isNotEmpty
                    ? CachedNetworkImageProvider(imageUrl)
                    : AssetImage(
                        iconMapInactive,
                      ),
              ),
            ),
          ),
          Visibility(
            visible: showBadge,
            child: Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 16.0,
                height: 16.0,
                decoration: BoxDecoration(
                  color: ColorPalette.red50,
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: AssetImage(iconCrown),
                ),
              ),
            ),
          ),
        ],
      );
}

library information_box;

import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';

class InformationBox extends StatelessWidget {
  final String iconLeft;
  final String iconRight;
  final bool showIconLeft;
  final bool showIconRight;
  final String label;

  const InformationBox({
    Key key,
    this.iconLeft = '',
    this.iconRight = '',
    this.showIconLeft = true,
    this.showIconRight = false,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ColorPalette.grey500,
      decoration: BoxDecoration(
        color: ColorPalette.grey500,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      height: 49.0,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Visibility(
            visible: showIconLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 24.0,
                ),
                Image(
                  image: AssetImage(iconLeft),
                ),
                SizedBox(
                  width: 24.0,
                ),
              ],
            ),
          ),
          Flexible(child: Text(label).h2()),
          Visibility(
            visible: showIconRight,
            child: Row(
              children: [
                SizedBox(
                  width: 24.0,
                ),
                Image(
                  image: AssetImage(iconRight),
                ),
                // SizedBox(
                //   width: 24.0,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

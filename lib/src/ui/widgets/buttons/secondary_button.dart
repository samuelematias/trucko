import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/loading/custom_progress_indicator.dart';

class SecondaryButton extends StatelessWidget {
  final String labelLeft;
  final String labelRight;
  final bool loading;
  final VoidCallback onPressed;
  final bool disabled;
  final bool isKeyboardVisible;

  const SecondaryButton({
    @required this.labelLeft,
    @required this.labelRight,
    @required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.isKeyboardVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: !disabled && !loading ? onPressed : null,
      color: ColorPalette.green50,
      disabledColor: loading ? ColorPalette.green50 : ColorPalette.grey50,
      shape: RoundedRectangleBorder(
        borderRadius: isKeyboardVisible
            ? BorderRadius.circular(0.0)
            : BorderRadius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        child: loading
            ? CustomProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    labelLeft,
                    textAlign: TextAlign.center,
                  ).b1(
                    color: disabled || onPressed == null
                        ? ColorPalette.grey200
                        : ColorPalette.white50,
                  ),
                  Text(
                    labelRight,
                    textAlign: TextAlign.center,
                  ).b1(
                    color: disabled || onPressed == null
                        ? ColorPalette.grey200
                        : ColorPalette.white50,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
      ),
    );
  }
}

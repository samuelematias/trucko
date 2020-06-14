import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/widgets/loading/custom_progress_indicator.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;
  final bool disabled;
  final bool isKeyboardVisible;

  const PrimaryButton({
    @required this.label,
    @required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.isKeyboardVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: !disabled && !loading ? onPressed : null,
      color: ColorPalette.blue50,
      disabledColor: loading ? ColorPalette.blue50 : ColorPalette.grey50,
      shape: RoundedRectangleBorder(
        borderRadius: isKeyboardVisible
            ? BorderRadius.circular(0.0)
            : BorderRadius.circular(8.0),
      ),
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        child: loading
            ? CustomProgressIndicator(
                valueColor: ColorPalette.blue50,
              )
            : Text(
                label,
                textAlign: TextAlign.center,
              ).b1(
                color: disabled || onPressed == null
                    ? ColorPalette.grey200
                    : ColorPalette.white50,
              ),
      ),
    );
  }
}

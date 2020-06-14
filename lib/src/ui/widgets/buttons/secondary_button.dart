import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/loading/custom_progress_indicator.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;
  final bool disabled;
  final bool isKeyboardVisible;

  const SecondaryButton({
    @required this.label,
    @required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.isKeyboardVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: ColorPalette.green50, width: 2),
      highlightedBorderColor: ColorPalette.green50,
      disabledBorderColor:
          loading ? ColorPalette.green50 : ColorPalette.grey100,
      onPressed: !disabled && !loading ? onPressed : null,
      color: ColorPalette.white50,
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
                valueColor: ColorPalette.green50,
              )
            : Text(
                label,
                textAlign: TextAlign.center,
              ).b1(
                color: disabled || onPressed == null
                    ? ColorPalette.grey200
                    : ColorPalette.green50,
              ),
      ),
    );
  }
}

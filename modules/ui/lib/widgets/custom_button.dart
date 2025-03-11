import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum CustomButtonType { primary, secondary, danger }

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final CustomButtonType buttonType;
  late final Color buttonColor;
  late final Color textColor;
  late final Color borderColor;

  CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonType = CustomButtonType.primary,
  }) {
    if (buttonType == CustomButtonType.primary) {
      buttonColor = AppColor.primaryColor;
      textColor = AppColor.onPrimaryColor;
      borderColor = AppColor.primaryBorderColor;
    } else if (buttonType == CustomButtonType.secondary) {
      buttonColor = AppColor.secondaryColor;
      textColor = AppColor.onSecondaryColor;
      borderColor = AppColor.secondaryBorderColor;
    } else if (buttonType == CustomButtonType.danger) {
      buttonColor = AppColor.dangerColor;
      textColor = AppColor.onDangerColor;
      borderColor = AppColor.dangerBorderColor;
    } else {
      buttonColor = AppColor.primaryColor;
      textColor = AppColor.onPrimaryColor;
      borderColor = AppColor.primaryBorderColor;
    }
  }

  bool get isActive {
    return onPressed != null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.infinity),
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          textStyle: const TextStyle(fontSize: AppConfig.fontSizeMD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        onPressed: isActive
            ? () {
                onPressed?.call();
              }
            : null,
        child: Text(text),
      ),
    );
  }
}

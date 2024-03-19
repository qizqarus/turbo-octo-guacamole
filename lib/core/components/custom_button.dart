import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_by_nb/core/utils/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final bool isOutlined;
  final IconData? icon;
  final EdgeInsetsGeometry? iconPadding;
  final double? height;
  final double? width;
  final double? iconSize;
  final double? fontSize;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.grey8,
    this.textColor = Colors.white,
    this.borderColor = AppColors.grey8,
    this.borderRadius = 4.0,
    this.isOutlined = false,
    this.icon,
    this.iconPadding,
    this.height = 48,
    this.width,
    this.iconSize = 20,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final Widget label = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: textColor,
                size: iconSize,
              ),
              Padding(
                padding: iconPadding ?? const EdgeInsets.only(left: 5.0),
                child: Text(
                  text,
                  style: GoogleFonts.roboto(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        : Text(
            text,
            style: GoogleFonts.roboto(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          );

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.black, width: 1.2),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side:
                  isOutlined ? BorderSide(color: borderColor) : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 5)),
          minimumSize: height != null
              ? MaterialStateProperty.all<Size>(Size(double.infinity, height!))
              : null),
      child: label,
    );
  }
}

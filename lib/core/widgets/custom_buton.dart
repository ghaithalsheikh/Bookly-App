import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({
    super.key,
    required this.textButton,
    required this.textColor,
    required this.backgroundColor,
    this.borderRadius,
    required this.onpressed,
    this.fontSize,
    this.onPressed,
  });
  final String textButton;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final VoidCallback onpressed;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          textButton,
          style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

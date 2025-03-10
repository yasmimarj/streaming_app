import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isTextButton;
  final double? fontSize;
  final Color? backgroundColor;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isTextButton = false,
    this.fontSize,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (isTextButton) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: const Color(0xFFAA73F0),
            fontSize: fontSize ?? screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: screenWidth / 2,
          decoration: BoxDecoration(
            color: backgroundColor ?? const Color.fromRGBO(170, 115, 240, 0.2),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(241, 205, 76, 0.1),
                blurRadius: 18.33,
                spreadRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
            border: Border.all(color: const Color(0xFFAA73F0), width: 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFAA73F0),
              fontSize: fontSize ?? screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }
}

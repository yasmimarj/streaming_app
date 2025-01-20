import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;

  const SimpleButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.08;
    final double verticalPadding = screenHeight * 0.015;
    final double fontSize = screenWidth * 0.03;
    final String fontFamily = "Epilogue";

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: borderColor),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          color: borderColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

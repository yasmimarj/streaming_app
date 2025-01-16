import 'package:flutter/material.dart';

class GenericTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onTap;

  const GenericTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontFamily: 'Fieldwork',
              color: Color.fromRGBO(170, 115, 240, 1),
              fontSize: MediaQuery.of(context).size.width * 0.024,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

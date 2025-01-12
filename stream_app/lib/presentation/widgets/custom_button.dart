import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33F1CC4C),
              blurRadius: 30,
              spreadRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(63, 40, 73, 1.0),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: const Color(0xFFAA73F0), width: 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFFAA73F0),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

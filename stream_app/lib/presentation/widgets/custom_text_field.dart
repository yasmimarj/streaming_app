import 'package:flutter/material.dart';
import 'package:stream_app/presentation/styles/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final String? svgIconPath;
  final VoidCallback? onIconTap;

  const CustomTextField({
    Key? key,
    required this.label,
    this.isPassword = false,
    this.svgIconPath,
    this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: isPassword
              ? [
                  const BoxShadow(
                    color: Color.fromRGBO(176, 178, 204, 0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: Offset(0, -6),
                  ),
                ]
              : [ ]
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: AppTheme.inputDecoration(
          label,
          svgIconPath: svgIconPath,
          onIconTap: onIconTap,
        ),
        style: const TextStyle(color: AppTheme.textColor),
      ),
    );
  }
}

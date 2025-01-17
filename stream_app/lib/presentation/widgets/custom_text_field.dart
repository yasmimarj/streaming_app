import 'package:flutter/material.dart';
import 'package:stream_app/presentation/styles/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final String? svgIconPath;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.label,
    this.isPassword = false,
    this.svgIconPath,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: widget.isPassword
            ? [
                const BoxShadow(
                  color: Color.fromRGBO(176, 178, 204, 0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: Offset(0, -6),
                ),
              ]
            : [],
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: AppTheme.inputDecoration(
          widget.label,
          svgIconPath: widget.svgIconPath,
          onIconTap: widget.isPassword ? _togglePasswordVisibility : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppTheme.textColor,
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
        ),
        style: const TextStyle(color: AppTheme.textColor),
      ),
    );
  }
}

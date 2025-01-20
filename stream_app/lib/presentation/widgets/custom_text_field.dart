import 'package:flutter/material.dart';
import 'package:untold/presentation/styles/app_theme.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.01,
        vertical: screenHeight * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        boxShadow: widget.isPassword
            ? [
                BoxShadow(
                  color: const Color.fromRGBO(176, 178, 204, 0.2),
                  blurRadius: screenWidth * 0.03,
                  spreadRadius: screenWidth * 0.001,
                  offset: Offset(0, -screenHeight * 0.003),
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
                    size: screenWidth * 0.04,
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
        ),
        style: TextStyle(
          color: AppTheme.textColor,
          fontSize: screenWidth * 0.02,
        ),
      ),
    );
  }
}

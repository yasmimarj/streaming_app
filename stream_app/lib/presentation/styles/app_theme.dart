import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Colors.purple;
  static const Color backgroundColor = Colors.black;
  static const Color inputFieldBackground = Color(0xFF1E1E1E);
  static const Color borderColor = Color(0xFF6C6D7A);
  static const Color textColor = Colors.white;
  static const Color labelColor = Color(0xFF6C6D7A);

  static InputDecoration inputDecoration(String label,
      {String? svgIconPath, VoidCallback? onIconTap}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: labelColor),
      filled: true,
      fillColor: inputFieldBackground,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderColor, width: 2),
      ),
      suffixIcon: svgIconPath != null
          ? GestureDetector(
              onTap: onIconTap,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  svgIconPath,
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    labelColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            )
          : null,
    );
  }

  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    textTheme: GoogleFonts.epilogueTextTheme(),
    primaryColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: inputFieldBackground,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: borderColor, width: 2),
      ),
      labelStyle: const TextStyle(color: labelColor),
    ),
  );
}

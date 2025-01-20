import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final Color backgroundColor;
  final Color? iconColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double iconSize;

  const CustomIconButton({
    Key? key,
    this.iconPath,
    this.iconData,
    required this.backgroundColor,
    required this.onPressed,
    this.iconColor,
    this.width = 70,
    this.height = 70,
    this.iconSize = 30,
  })  : assert(iconPath != null || iconData != null,
            'You must provide either iconPath or iconData'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: iconPath != null
              ? SvgPicture.asset(
                  iconPath!,
                  width: iconSize,
                  height: iconSize,
                )
              : Icon(
                  iconData,
                  size: iconSize,
                  color: iconColor ?? Colors.white,
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  final String iconPath;
  final bool isSvg;
  final String title;
  final String? subtitle;
  final String? trailingText;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    required this.iconPath,
    required this.isSvg,
    required this.title,
    this.subtitle,
    this.trailingText,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double iconSize = screenWidth * 0.04;
    final double imageSize = screenWidth * 0.06;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(51, 51, 63, 0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 13),
        leading: isSvg
            ? SvgPicture.asset(
                iconPath,
                width: iconSize,
                height: iconSize,
              )
            : Image.asset(
                iconPath,
                width: imageSize,
                height: imageSize,
              ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.03,
            fontWeight: FontWeight.w500,
            fontFamily: "Epilogue",
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 0.45),
                  fontSize: screenWidth * 0.02,
                  fontFamily: "Epilogue",
                ),
              )
            : null,
        trailing: trailingText != null
            ? Text(
                trailingText!,
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.02,
                  fontFamily: "Epilogue",
                ),
              )
            : trailingIcon != null
                ? Icon(
                    trailingIcon,
                    color: Colors.white,
                    size: screenWidth * 0.02,
                  )
                : null,
        onTap: onTap,
      ),
    );
  }
}

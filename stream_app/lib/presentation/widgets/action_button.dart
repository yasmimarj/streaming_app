import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButton extends StatelessWidget {
  final String assetPath;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ActionButton({
    Key? key,
    required this.assetPath,
    required this.label,
    this.onTap,
    this.iconColor = Colors.white70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double iconSize = screenWidth * 0.04;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            assetPath,
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: screenWidth * 0.02,
            ),
          ),
        ],
      ),
    );
  }
}

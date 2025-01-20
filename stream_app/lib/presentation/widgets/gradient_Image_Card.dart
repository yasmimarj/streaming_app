import 'package:flutter/material.dart';

class GradientImageCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const GradientImageCard({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double cardHeight = screenHeight * 0.8;
    final double cardWidth = screenWidth * 0.6;
    final double borderRadius = screenWidth * 0.05;
    final double textFontSize = screenWidth * 0.025;

    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: cardHeight * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(borderRadius),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Epílogue',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: textFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImagePicker extends StatelessWidget {
  final String imagePath;
  final VoidCallback onCameraTap;

  const ProfileImagePicker({
    Key? key,
    required this.imagePath,
    required this.onCameraTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: screenWidth * 0.1,
          backgroundImage: imagePath.isNotEmpty
              ? NetworkImage(imagePath) as ImageProvider
              : const AssetImage('assets/eva.png'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onCameraTap,
            child: Container(
              width: screenWidth * 0.08,
              height: screenWidth * 0.08,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 48, 47, 47),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/camera.svg',
                  color: const Color.fromRGBO(170, 115, 240, 1),
                  width: screenWidth * 0.04,
                  height: screenWidth * 0.04,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

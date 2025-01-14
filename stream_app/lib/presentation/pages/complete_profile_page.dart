import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stream_app/presentation/widgets/custom_button.dart';
import 'package:stream_app/presentation/widgets/custom_icon_button.dart';
import 'package:stream_app/presentation/widgets/custom_text_field.dart';

class CompleteProfilePage extends StatelessWidget {
  final String jwt;
  final Map<String, dynamic> user;
  const CompleteProfilePage({
    Key? key,
    required this.jwt,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(19, 20, 24, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 75),
              SvgPicture.asset(
                'assets/subtract.svg',
                width: 32,
                height: 32,
              ),
              const SizedBox(height: 75),
              const Text(
                'Tell us more!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 11),
              Text(
                'Complete your profile, ${user['username']}! ',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(255, 255, 255, 0.45),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    iconPath: 'assets/camera.svg',
                    backgroundColor: const Color(0xFF2E1635),
                    width: 100,
                    height: 100,
                    iconSize: 20,
                    onPressed: () {
                      // TODO: Adicionar funcionalidade de selecionar imagem
                    },
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CHOOSE IMAGE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Epilogue"),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'A square .jpg, .gif, or .png image\n200x200 or larger',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Epilogue"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.08),
              const CustomTextField(
                label: 'Your name',
              ),
              SizedBox(height: screenHeight * 0.08),
              CustomButton(
                label: 'Continue',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back",
                  style: TextStyle(
                    color: Color(0xFFAA73F0),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

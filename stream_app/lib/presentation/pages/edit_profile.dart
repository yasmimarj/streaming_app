import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untold/presentation/widgets/custom_button.dart';
import 'package:untold/presentation/widgets/custom_icon_button.dart';
import 'package:untold/presentation/widgets/custom_text_field.dart';
import 'package:untold/presentation/widgets/profile_image_picker.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _selectedImage;

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 20, 24),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Seta de voltar
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  IconButton(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Color.fromRGBO(170, 115, 240, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Título em duas linhas
              Text(
                'Edit\nProfile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w700,
                  height: 1.2, // Controle de espaçamento entre linhas
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileImagePicker(
                    imagePath:
                        _selectedImage != null ? _selectedImage!.path : '',
                    onCameraTap: _pickImage,
                  ),
                  SizedBox(width: screenHeight * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CHOOSE IMAGE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.02,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Epilogue",
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'A square .jpg, .gif,\nor .png image\n200x200 or larger',
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: MediaQuery.of(context).size.width * 0.018,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Epilogue",
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),
              CustomTextField(
                label: 'Your name',
                controller: currentPasswordController,
              ),

              // Divisor

              SizedBox(height: screenHeight * 0.3),

              // Botão de atualizar senha
              Center(
                child: CustomButton(
                  label: 'Update Password',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

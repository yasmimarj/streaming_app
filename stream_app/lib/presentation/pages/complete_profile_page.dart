import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untold/core/services/auth_service.dart';
import 'package:untold/core/utils/navigation_utils.dart';
import 'package:untold/data/models/app_user.dart';
import 'package:untold/data/models/register_request.dart';
import 'package:untold/data/services/api_service.dart';
import 'package:untold/presentation/pages/home_page.dart';
import 'package:untold/presentation/widgets/custom_button.dart';
import 'package:untold/presentation/widgets/custom_icon_button.dart';
import 'package:untold/presentation/widgets/custom_text_field.dart';

class CompleteProfilePage extends StatefulWidget {
  final String email;
  final String password;

  const CompleteProfilePage({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  File? _selectedImage;

  final TextEditingController usernameController = TextEditingController();
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
    final screenHeight = MediaQuery.of(context).size.height;
    final authService = AuthService();

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
              Text(
                'Tell us more!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 11),
              Text(
                'Complete your profile! ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(255, 255, 255, 0.45),
                  fontSize: MediaQuery.of(context).size.width * 0.025,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 64),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_selectedImage != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(_selectedImage!),
                    )
                  else
                    CustomIconButton(
                      iconPath: 'assets/camera.svg',
                      backgroundColor: const Color(0xFF2E1635),
                      width: 100,
                      height: 100,
                      iconSize: 20,
                      onPressed: _pickImage,
                    ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CHOOSE IMAGE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Epilogue"),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'A square .jpg, .gif, or .png image\n200x200 or larger',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: MediaQuery.of(context).size.width * 0.018,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Epilogue"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.08),
              CustomTextField(
                label: 'Your name',
                controller: usernameController,
              ),
              SizedBox(height: screenHeight * 0.08),
              CustomButton(
                label: 'Complete Registration',
                onPressed: () async {
                  if (usernameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please provide your name.'),
                      ),
                    );
                    return;
                  }

                  if (_selectedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an image.'),
                      ),
                    );
                    return;
                  }

                  try {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
                    final user = await authService.registerWithEmailAndPassword(
                      widget.email,
                      widget.password,
                      usernameController.text,
                    );

                    Navigator.pop(context);

                    if (user != null) {
                      // Obtém o token do Firebase Auth
                      final token = await authService.getAuthToken();
                      if (token == null) {
                        throw Exception("Token não encontrado.");
                      }

                      final apiService = createApiService(authService);

                      // Cria o objeto RegisterRequest
                      final registerRequest = RegisterRequest(
                        username: usernameController.text,
                        email: widget.email,
                        password: widget.password,
                      );

                      try {
                        final response =
                            await apiService.register(registerRequest);
                        print("JWT: ${response.jwt}");
                        print("Username: ${response.apiUser.username}");
                      } catch (e) {
                        print("Erro ao registrar: $e");
                      }
                      navigateWithFade(
                        context,
                        HomePage(
                          user: AppUser(
                            displayName: user.displayName ?? 'User',
                            email: user.email ?? '',
                            photoURL: user.photoURL,
                          ),
                        ),
                      );
                    }
                  } catch (error) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Failed to complete registration: $error',
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
                isTextButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

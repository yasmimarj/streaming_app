import 'package:flutter/material.dart';
import 'package:untold/presentation/widgets/custom_button.dart';
import 'package:untold/presentation/widgets/custom_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              Text(
                'Change\nPassword',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CustomTextField(
                label: 'Current password',
                controller: currentPasswordController,
                isPassword: true,
              ),
              SizedBox(height: screenHeight * 0.02),
              Divider(
                color: Colors.white.withOpacity(0.3),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                label: 'New password',
                controller: newPasswordController,
                isPassword: true,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                label: 'Confirm new password',
                controller: confirmPasswordController,
                isPassword: true,
              ),
              SizedBox(height: screenHeight * 0.3),
              Center(
                child: CustomButton(
                  label: 'Update Password',
                  onPressed: () {
                    final currentPassword =
                        currentPasswordController.text.trim();
                    final newPassword = newPasswordController.text.trim();
                    final confirmPassword =
                        confirmPasswordController.text.trim();

                    if (newPassword != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords do not match!'),
                        ),
                      );
                      return;
                    }

                    // TODO: Lógica de atualização de senha
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

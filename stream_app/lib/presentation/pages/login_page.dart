import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untold/core/services/google_sign_in_service.dart';
import 'package:untold/core/utils/navigation_utils.dart';
import 'package:untold/data/models/app_user.dart';
import 'package:untold/presentation/pages/complete_profile_page.dart';
import 'package:untold/presentation/pages/home_page.dart';
import 'package:untold/presentation/pages/welcome_back.dart';
import 'package:untold/presentation/widgets/custom_button.dart';
import 'package:untold/presentation/widgets/custom_text_field.dart';
import 'package:untold/presentation/widgets/divider_with_text.dart';
import 'package:untold/presentation/widgets/custom_icon_button.dart';
import 'package:untold/presentation/widgets/generic_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(19, 20, 24, 1),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                SvgPicture.asset(
                  'assets/subtract_phrase.svg',
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GenericTextButton(
                      text: 'Sign In!',
                      onTap: () {
                        navigateWithFade(
                          context,
                          const WelcomeBackPage(),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'To get started, please complete your account registration.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(
                      iconPath: 'assets/google.svg',
                      backgroundColor: const Color(0xFF2E1635),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );

                        try {
                          final googleUser =
                              await GoogleSignInService().signInWithGoogle();
                          if (googleUser != null) {
                            final appUser = AppUser(
                              displayName: googleUser.displayName ?? "User",
                              email: googleUser.email,
                              photoURL: googleUser.photoURL,
                            );

                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(user: appUser),
                              ),
                              (route) => false,
                            );
                          } else {
                            Navigator.pop(context);
                            print("User canceled the login.");
                          }
                        } catch (e) {
                          Navigator.pop(context);
                          print("Error while logging in with Google: $e");
                        }
                      },
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    CustomIconButton(
                      iconPath: 'assets/apple.svg',
                      backgroundColor: const Color(0xFF6C6D7A),
                      onPressed: () {
                        // TODO: login with apple
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                const DividerWithText(text: 'Or Sign up With'),
                SizedBox(height: screenHeight * 0.04),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: screenHeight * 0.01),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  svgIconPath: 'assets/eye.svg',
                ),
                SizedBox(height: screenHeight * 0.01),
                CustomTextField(
                  label: 'Confirm your Password',
                  controller: confirmPasswordController,
                  isPassword: true,
                  svgIconPath: 'assets/eye.svg',
                ),
                SizedBox(height: screenHeight * 0.04),
                CustomButton(
                  label: 'Create Account',
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All fields are required.'),
                        ),
                      );
                      return;
                    }

                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!emailRegex.hasMatch(emailController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid email address.'),
                        ),
                      );
                      return;
                    }
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords do not match.'),
                        ),
                      );
                      return;
                    }
                    try {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteProfilePage(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        ),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to navigate: $error'),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

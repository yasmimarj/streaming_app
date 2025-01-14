import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_app/core/services/auth_service.dart';
import 'package:stream_app/core/services/google_sign_in_service.dart';
import 'package:stream_app/presentation/pages/complete_profile_page.dart';
import 'package:stream_app/presentation/pages/home_page.dart';
import 'package:stream_app/presentation/widgets/custom_button.dart';
import 'package:stream_app/presentation/widgets/custom_text_field.dart';
import 'package:stream_app/presentation/widgets/divider_with_text.dart';
import 'package:stream_app/presentation/widgets/custom_icon_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(19, 20, 24, 1),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                SvgPicture.asset(
                  'assets/subtract_phrase.svg',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: navigate to login screen
                      },
                      child: const Text(
                        'Sign In!',
                        style: TextStyle(
                          fontFamily: 'Fieldwork',
                          color: Color.fromRGBO(170, 115, 240, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),
                const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'To get started, please complete your account registration.',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: 14,
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
                        final googleUser =
                            await GoogleSignInService().signInWithGoogle();
                        if (googleUser != null) {
                          print('Logged in as ${googleUser.displayName}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(user: googleUser),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 16),
                    CustomIconButton(
                      iconPath: 'assets/apple.svg',
                      backgroundColor: const Color(0xFF6C6D7A),
                      onPressed: () {
                        // TODO: login with apple
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const DividerWithText(text: 'Or Sign up With'),
                SizedBox(height: screenHeight * 0.04),
                CustomTextField(
                  label: 'Username',
                  controller: usernameController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  svgIconPath: 'assets/eye.svg',
                ),
                const SizedBox(height: 16),
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
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );

                      final result = await createAccount(
                        emailController.text,
                        passwordController.text,
                        usernameController.text,
                      );

                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteProfilePage(
                            jwt: result['jwt'],
                            user: result['user'],
                          ),
                        ),
                      );
                    } catch (error) {
                      Navigator.pop(context);
                      print("Deu erro na API: $error ");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to create account: $error'),
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

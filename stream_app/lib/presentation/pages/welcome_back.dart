import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stream_app/core/services/google_sign_in_service.dart';
import 'package:stream_app/core/utils/navigation_utils.dart';
import 'package:stream_app/data/models/app_user.dart';
import 'package:stream_app/presentation/pages/forgout_password.dart';
import 'package:stream_app/presentation/pages/home_page.dart';
import 'package:stream_app/presentation/pages/login_page.dart';
import 'package:stream_app/presentation/widgets/custom_button.dart';
import 'package:stream_app/presentation/widgets/custom_icon_button.dart';
import 'package:stream_app/presentation/widgets/custom_text_field.dart';
import 'package:stream_app/presentation/widgets/divider_with_text.dart';
import 'package:stream_app/presentation/widgets/generic_text_button.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  State<WelcomeBackPage> createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                  'assets/subtract.svg',
                  width: 30,
                  height: 30,
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Look who is here!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.024,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.06),
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
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: GenericTextButton(
                    text: 'Forgot Password?',
                    onTap: () {
                      navigateWithFade(
                        context,
                        const ForgoutPasswordPage(),
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                CustomButton(
                  label: 'Login',
                  onPressed: () async {
                    try {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill in all fields')),
                        );
                        return;
                      }

                      final userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);

                      final firebaseUser = userCredential.user;

                      if (firebaseUser != null) {
                        final appUser = AppUser(
                          displayName: firebaseUser.displayName ?? "User",
                          email: firebaseUser.email ?? "",
                          photoURL: firebaseUser.photoURL,
                        );

                        navigateWithFade(
                          context,
                          HomePage(user: appUser),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      String message;
                      if (e.code == 'user-not-found') {
                        message = 'No user found for that email.';
                      } else if (e.code == 'wrong-password') {
                        message = 'Wrong password provided for that user.';
                      } else {
                        message = 'An error occurred. Please try again.';
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('An unexpected error occurred: $e')),
                      );
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
                const DividerWithText(text: 'Or Sign up With'),
                SizedBox(height: screenHeight * 0.03),
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
                          final appUser = AppUser(
                            displayName: googleUser.displayName ?? "User",
                            email: googleUser.email,
                            photoURL: googleUser.photoURL,
                          );
                          navigateWithFade(
                            context,
                            HomePage(user: appUser),
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
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont't have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontSize: MediaQuery.of(context).size.width * 0.024,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GenericTextButton(
                      text: 'Sign Up!',
                      onTap: () {
                        navigateWithFade(
                          context,
                          const LoginPage(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

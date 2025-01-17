import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stream_app/core/utils/navigation_utils.dart';
import 'package:stream_app/presentation/pages/instructions_page.dart';
import 'package:stream_app/presentation/widgets/custom_button.dart';
import 'package:stream_app/presentation/widgets/custom_text_field.dart';

class ForgoutPasswordPage extends StatefulWidget {
  const ForgoutPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgoutPasswordPage> createState() => _ForgoutPasswordPageState();
}

class _ForgoutPasswordPageState extends State<ForgoutPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Enter the email address you used when you joined and we'll send you instructions to reset your password.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.024,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomTextField(
                  label: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: screenHeight * 0.4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    children: [
                      CustomButton(
                        label: 'Send reset instructions',
                        onPressed: () async {
                          final email = emailController.text.trim();

                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please enter your email address.'),
                              ),
                            );
                            return;
                          }

                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: email);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Reset instructions sent! Check your email.',
                                ),
                              ),
                            );
                            navigateWithFade(
                              context,
                              const InstructionsPage(),
                            );
                          } on FirebaseAuthException catch (e) {
                            String errorMessage;
                            if (e.code == 'user-not-found') {
                              errorMessage = 'No user found for this email.';
                            } else if (e.code == 'invalid-email') {
                              errorMessage = 'The email address is not valid.';
                            } else {
                              errorMessage =
                                  'An unexpected error occurred. Please try again.';
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('An error occurred: $e'),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: screenHeight * 0.016),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

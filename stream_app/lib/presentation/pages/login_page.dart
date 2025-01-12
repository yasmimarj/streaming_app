import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_app/presentation/widgets/custom_button.dart';
import 'package:stream_app/presentation/widgets/custom_text_field.dart';
import 'package:stream_app/presentation/widgets/divider_with_text.dart';
import 'package:stream_app/presentation/widgets/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(19, 20, 24, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/subtract_phrase.svg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 32),
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
            const SizedBox(height: 32),
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
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  iconPath: 'assets/google.svg',
                  backgroundColor: const Color(0xFF2E1635),
                  onPressed: () {
                    // TODO: login with google
                  },
                ),
                const SizedBox(width: 16),
                SocialButton(
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
            const SizedBox(height: 32),
            const CustomTextField(
              label: 'Email',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Password',
              isPassword: true,
              svgIconPath: 'assets/eye.svg',
              onIconTap: () {
                // TODO
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Confirm your Password',
              isPassword: true,
              svgIconPath: 'assets/eye.svg',
              onIconTap: () {
                // TODO
              },
            ),
            const SizedBox(height: 32),
            CustomButton(
              label: 'Create Account',
              onPressed: () {
                // TODO: Create Account
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untold/core/utils/navigation_utils.dart';
import 'package:untold/presentation/pages/login_page.dart';
import 'package:untold/presentation/widgets/custom_button.dart';

class InstructionsPage extends StatefulWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  State<InstructionsPage> createState() => _InstructionsPagePageState();
}

class _InstructionsPagePageState extends State<InstructionsPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
                  width: screenHeight * 0.08,
                  height: screenHeight * 0.08,
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'The instructions were sent!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "If this was a valid email, instructions to reset your password will be sent to you. Please check your email.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                  child: Column(
                    children: [
                      CustomButton(
                        label: 'Login',
                        onPressed: () async {
                          navigateWithFade(
                            context,
                            const LoginPage(),
                          );
                        },
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

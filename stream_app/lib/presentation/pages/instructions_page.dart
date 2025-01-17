import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stream_app/core/utils/navigation_utils.dart';
import 'package:stream_app/presentation/pages/login_page.dart';
import 'package:stream_app/presentation/widgets/custom_button.dart';

class InstructionsPage extends StatefulWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  State<InstructionsPage> createState() => _InstructionsPagePageState();
}

class _InstructionsPagePageState extends State<InstructionsPage> {
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
                  'The instructions were sent!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "If this was a valid email, instructions to reset your password will be sent to you. Please check your email.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.025,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
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

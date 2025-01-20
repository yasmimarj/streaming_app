import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untold/core/services/auth_service.dart';
import 'package:untold/core/services/google_sign_in_service.dart';
import 'package:untold/core/utils/navigation_utils.dart';
import 'package:untold/data/models/api_user.dart';
import 'package:untold/data/models/app_user.dart';
import 'package:untold/data/repositories/user_repository.dart';
import 'package:untold/data/services/api_service.dart';
import 'package:untold/data/services/dio_config.dart';
import 'package:untold/presentation/pages/forgout_password.dart';
import 'package:untold/presentation/pages/home_page.dart';
import 'package:untold/presentation/pages/login_page.dart';
import 'package:untold/presentation/widgets/custom_button.dart';
import 'package:untold/presentation/widgets/custom_icon_button.dart';
import 'package:untold/presentation/widgets/custom_text_field.dart';
import 'package:untold/presentation/widgets/divider_with_text.dart';
import 'package:untold/presentation/widgets/generic_text_button.dart';

class WelcomeBackPage extends StatefulWidget {
  const WelcomeBackPage({Key? key}) : super(key: key);

  @override
  State<WelcomeBackPage> createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late UserRepository userRepository;
  late AuthService authService;
  List<ApiUser> users = [];

  @override
  void initState() {
    super.initState();
    authService = AuthService();
  }

  Future<void> fetchUsers() async {
    try {
      final List<ApiUser> fetchedUsers =
          await userRepository.fetchAndStoreUsers();

      for (var user in fetchedUsers) {
        print(user);
      }

      setState(() {
        users = fetchedUsers;
      });
    } catch (e) {
      print("Erro ao buscar usuários: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao buscar usuários: $e')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1),
                SvgPicture.asset(
                  'assets/subtract.svg',
                  width: screenWidth * 0.08,
                  height: screenWidth * 0.08,
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Look who is here!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.06),
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
                SizedBox(height: screenHeight * 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.01),
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
                        final String? token =
                            await firebaseUser.getIdToken(true);
                        if (token != null) {
                          final dio = setupDio(authService);
                          final apiService = ApiService(dio);
                          userRepository = UserRepository(apiService);
                          await fetchUsers();

                          final appUser = AppUser(
                            displayName: firebaseUser.displayName ?? "User",
                            email: firebaseUser.email ?? "",
                            photoURL: firebaseUser.photoURL,
                          );

                          navigateWithFade(
                            context,
                            HomePage(user: appUser),
                          );
                        } else {
                          throw Exception("Falha ao obter o token JWT.");
                        }
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontSize: screenWidth * 0.03,
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

import 'package:flutter/material.dart';
import 'package:untold/presentation/styles/app_theme.dart';
import 'presentation/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Untold Stream',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stream_app/presentation/styles/app_theme.dart';
import 'presentation/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
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

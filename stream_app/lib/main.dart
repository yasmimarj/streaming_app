import 'package:flutter/material.dart';
import 'package:stream_app/presentation/styles/app_theme.dart';
import 'presentation/pages/splash_page.dart';

void main() {
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

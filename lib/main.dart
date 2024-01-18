import 'package:flutter/material.dart';
import 'package:whatsappc/presentation/startupScreens/splash_screen.dart';
import 'package:whatsappc/utils/design_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: whatsAppClone,
      theme: appTheme,
      home: const SplashScreen(),
    );
  }
}


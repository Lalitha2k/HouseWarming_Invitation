import 'package:flutter/material.dart';
import 'intro_animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gruha Pravesham Invitation',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
      bodyMedium: TextStyle(fontFamily: "Playfair"),
      bodyLarge: TextStyle(fontFamily: "Playfair"),
      bodySmall: TextStyle(fontFamily: "Playfair"),
      titleLarge: TextStyle(fontFamily: "Playfair"),
      titleMedium: TextStyle(fontFamily: "Playfair"),
      titleSmall: TextStyle(fontFamily: "Playfair"),
    ),
      ),
      home: const IntroAnimationScreen(),
    );
  }
}

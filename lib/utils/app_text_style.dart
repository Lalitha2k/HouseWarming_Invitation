import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle body(bool isEnglish,
      {double size = 16, FontWeight weight = FontWeight.normal}) {
    return TextStyle(
      fontFamily: isEnglish ? "Playfair" : "NotoTelugu",
      fontSize: size,
      fontWeight: weight,
      height: isEnglish ? 1.4 : 1.6,
      color: const Color(0xFF4A2C2A),
    );
  }

  static TextStyle title(bool isEnglish) {
    return TextStyle(
      fontFamily: isEnglish ? "Playfair" : "NotoTelugu",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: isEnglish ? 1.3 : 1.6,
      color: const Color(0xFF4A2C2A),
      letterSpacing: isEnglish ? 1.1 : 0,
    );
  }
  static TextStyle houseName({
  required bool isEnglish,
  double glowIntensity = 1,
}) {
  return TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    fontFamily: isEnglish ? 'Playfair' : 'NotoTelugu',
    letterSpacing: 1.3,
    color: const Color(0xFF4A2C2A),
    shadows: [
      Shadow(
        blurRadius: 18 * glowIntensity,
        color: const Color(0x66C9A24D), // temple gold glow
        offset: const Offset(0, 4),
      ),
    ],
  );
}

}

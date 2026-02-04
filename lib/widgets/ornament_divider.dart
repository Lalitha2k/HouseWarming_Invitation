import 'package:flutter/material.dart';

class OrnamentalDivider extends StatelessWidget {
  const OrnamentalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _line(),
          const SizedBox(width: 8),
          const Icon(
            Icons.brightness_1,
            size: 6,
            color: Color(0xFFB89B5E), // muted gold
          ),
          const SizedBox(width: 8),
          _line(),
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
      width: 50,
      height: 1,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            Color(0xFFB89B5E),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

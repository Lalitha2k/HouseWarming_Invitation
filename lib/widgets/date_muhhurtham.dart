import 'package:flutter/material.dart';

class DateMuhurthamSection extends StatelessWidget {
  final bool isEnglish;
  const DateMuhurthamSection({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Container(
  padding: const EdgeInsets.symmetric(
    vertical: 18, // ⬅️ reduced
    horizontal: 18,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(14), // ⬅️ smaller
    border: Border.all(
      color: Colors.brown.shade300,
      width: 1,
    ),
    image: DecorationImage(
      image: AssetImage("images/image3.jpg"),
      fit: BoxFit.cover,
      opacity: 0.20, // 🌸 very subtle
    ),
    color: Colors.brown.shade50, // fallback
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // ⬅️ IMPORTANT: reduces box height
    children: [
      _title(isEnglish ? "DATE" : "తేదీ"),
      const SizedBox(height: 4),
      _value(
        isEnglish
            ? "Friday, 20 February 2026"
            : "శుక్రవారం, 20 ఫిబ్రవరి 2026",
      ),

      const SizedBox(height: 16),
      _ornamentalDivider(),
      const SizedBox(height: 16),

      _title(isEnglish ? "MUHURTHAM" : "ముహూర్తం"),
      const SizedBox(height: 4),
      _value(
        isEnglish
            ? "9:15 AM – 10:30 AM"
            : "ఉదయం 9:15 నుండి 10:30 వరకు",
      ),
    ],
  ),
)

      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        letterSpacing: 1.6,
        fontWeight: FontWeight.w600,
        color: Colors.brown.shade700,
      ),
    );
  }

  Widget _value(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.brown.shade900,
        height: 1.4,
      ),
    );
  }

  /// 🌼 Traditional ornamental divider
  Widget _ornamentalDivider() {
    return Row(
      children: [
        Expanded(child: _line()),
        _dot(),
        _dot(big: true),
        _dot(),
        Expanded(child: _line()),
      ],
    );
  }

  Widget _line() {
    return Container(
      height: 0.8,
      color: Colors.brown.shade300,
    );
  }

  Widget _dot({bool big = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: big ? 6 : 4,
      height: big ? 6 : 4,
      decoration: BoxDecoration(
        color: Colors.brown.shade600,
        shape: BoxShape.circle,
      ),
    );
  }
}

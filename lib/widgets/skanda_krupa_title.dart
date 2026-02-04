import 'package:flutter/material.dart';
import 'package:housewarming_invite/utils/app_texts.dart';
import '../utils/app_text_style.dart';

class SkandaKrupaTitle extends StatefulWidget {
  final bool isEnglish;

  const SkandaKrupaTitle({
    super.key,
    required this.isEnglish,
  });

  @override
  State<SkandaKrupaTitle> createState() => _SkandaKrupaTitleState();
}

class _SkandaKrupaTitleState extends State<SkandaKrupaTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // Proud, slow expansion
    _scale = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // Very subtle fade-in
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.15, 1.0, curve: Curves.easeIn),
      ),
    );

    // Gentle devotional glow
    _glow = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts =
        widget.isEnglish ? AppTexts.english : AppTexts.telugu;

    return FadeTransition(
      opacity: _opacity,
      child: ScaleTransition(
        scale: _scale,
        child: Text(
          texts["house_name"]!,
          textAlign: TextAlign.center,
          style: AppTextStyle.houseName(
            isEnglish: widget.isEnglish,
            glowIntensity: _glow.value,
          ),
        ),
      ),
    );
  }
}

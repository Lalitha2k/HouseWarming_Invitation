import 'package:flutter/material.dart';
import 'package:housewarming_invite/utils/app_text_style.dart';
import 'package:housewarming_invite/widgets/countdown.dart';
import 'package:housewarming_invite/widgets/date_muhhurtham.dart';
import 'package:housewarming_invite/widgets/familyname.dart';
import 'package:housewarming_invite/widgets/googleMapButton.dart';
import 'package:housewarming_invite/widgets/ornament_divider.dart';
import 'package:housewarming_invite/widgets/skanda_krupa_title.dart';
import 'dart:async';
import '../widgets/floating_flowers.dart';
import '../utils/app_texts.dart';

class IntroAnimationScreen extends StatefulWidget {
  const IntroAnimationScreen({super.key});

  @override
  State<IntroAnimationScreen> createState() => _IntroAnimationScreenState();
}

class _IntroAnimationScreenState extends State<IntroAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Alignment> _alignmentAnimation;

  bool showText1 = false;
  bool showText2 = false;
  bool showDateSection = false;
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // Zoom + settle
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.6, end: 1.1)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.1, end: 0.9)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_controller);

    // Center → top
    _alignmentAnimation = AlignmentTween(
      begin: Alignment.center,
      end: const Alignment(0, -0.75),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 5200), () {
      setState(() => showText1 = true);
    });

    Future.delayed(const Duration(milliseconds: 6200), () {
      setState(() => showText2 = true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // 🌸 BACKGROUND TEXTURE
            Positioned.fill(
              child: Image.asset(
                'images/bg2.jpg',
                fit: BoxFit.cover,
                //color: Colors.white.withOpacity(0.85),
                //colorBlendMode: BlendMode.lighten,
              ),
            ),

            // Soft cream overlay (keeps devotional warmth)
            Positioned.fill(
              child: Container(
                color: const Color(0xFFFFF4E6).withOpacity(0.6),
              ),
            ),

            FloatingFlowers(active: showDateSection),

            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 1200),
                    opacity: 1,
                    child: Text(
                      "ॐ शरवणभवाय नमः",
                      textAlign: TextAlign.center,
                     // style: AppTextStyle.sacred(),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isEnglish = !isEnglish;
                        });
                      },
                      child: Text(
                        isEnglish ? "తెలుగు" : "English",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        height: 150,
                        alignment: _alignmentAnimation.value,
                        child: Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Image.asset(
                            'images/muruga.png',
                            height: 120,
                          ),
                        ),
                      );
                    },
                  ),

                  if (showText1)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TypewriterText(
                        text: isEnglish
                            ? AppTexts.english["invite_line1"]!
                            : AppTexts.telugu["invite_line1"]!,
                        isEnglish: isEnglish,
                      ),
                    ),

                  if (showText2)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TypewriterText(
                        text: isEnglish
                            ? AppTexts.english["invite_line2"]!
                            : AppTexts.telugu["invite_line2"]!,
                        isBold: true,
                        isEnglish: isEnglish,
                        onComplete: () {
                          setState(() {
                            showDateSection = true;
                          });
                        },
                      ),
                    ),

                  if (showDateSection) ...[
                    const SizedBox(height: 16),
ParentsInviteText(isEnglish:isEnglish),
const SizedBox(height: 20),

                    const SizedBox(height: 16),
                    const OrnamentalDivider(),
                    SkandaKrupaTitle(
                      key: ValueKey(isEnglish),
                      isEnglish: isEnglish,
                    ),
                    const OrnamentalDivider(),
                    const SizedBox(height: 12),
                    DateMuhurthamSection(isEnglish: isEnglish),
                    const SizedBox(height: 12),
                    GoogleMapsButton(isEnglish: isEnglish),
                    const SizedBox(height: 12),
                    CountdownSection(isEnglish: isEnglish),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final bool isBold;
  final VoidCallback? onComplete;
  final bool isEnglish;

  const TypewriterText({
    super.key,
    required this.text,
    this.isBold = false,
    this.onComplete,
    required this.isEnglish,
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String visibleText = "";
  int index = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void didUpdateWidget(covariant TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _timer?.cancel();
      visibleText = "";
      index = 0;
      _startTyping();
    }
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (index < widget.text.length) {
        setState(() {
          visibleText += widget.text[index];
          index++;
        });
      } else {
        timer.cancel();
        widget.onComplete?.call();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        visibleText,
        textAlign: TextAlign.center,
        style: AppTextStyle.body(
          widget.isEnglish,
          size: widget.isBold ? 20 : 16,
          weight: widget.isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

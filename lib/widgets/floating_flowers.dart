import 'dart:math';
import 'package:flutter/material.dart';

class FloatingFlowers extends StatelessWidget {
  const FloatingFlowers({super.key, required bool active});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final random = Random();

    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: List.generate(12, (index) {
            final double startX = random.nextDouble() * size.width;
            final double duration = 8 + random.nextDouble() * 6;
            final double flowerSize = 18 + random.nextDouble() * 22;

            return FallingFlower(
              startX: startX,
              duration: duration,
              size: flowerSize,
              delay: random.nextInt(6000),
            );
          }),
        ),
      ),
    );
  }
}

class FallingFlower extends StatefulWidget {
  final double startX;
  final double duration;
  final double size;
  final int delay;

  const FallingFlower({
    super.key,
    required this.startX,
    required this.duration,
    required this.size,
    required this.delay,
  });

  @override
  State<FallingFlower> createState() => _FallingFlowerState();
}

class _FallingFlowerState extends State<FallingFlower>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fallAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration.toInt()),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    _fallAnimation = Tween<double>(
      begin: -120,
      end: screenHeight * 2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    return AnimatedBuilder(
      animation: _fallAnimation,
      builder: (_, __) {
        return Positioned(
          top: _fallAnimation.value,
          left: widget.startX,
          child: Opacity(
            opacity: 0.90,
            child: Image.asset(
              'assets/images/flowerss.png',
              width: widget.size,
              height: widget.size,
            ),
          ),
        );
      },
    );
  }
}

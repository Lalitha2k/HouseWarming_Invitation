import 'dart:async';
import 'package:flutter/material.dart';
import 'package:housewarming_invite/utils/app_texts.dart';

class CountdownSection extends StatefulWidget {
  const CountdownSection({super.key, required this.isEnglish});

  final bool isEnglish;

  @override
  State<CountdownSection> createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  late Timer _timer;
  final DateTime eventDate = DateTime(2026, 2, 20, 9, 15);

  Duration remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateTime();
    });
  }

  void _calculateTime() {
    final now = DateTime.now();
    setState(() {
      remaining = eventDate.difference(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (remaining.isNegative) {
      return const SizedBox();
    }

    final texts =
        widget.isEnglish ? AppTexts.english : AppTexts.telugu;

    final days = remaining.inDays;
    final hours = remaining.inHours % 24;
    final minutes = remaining.inMinutes % 60;
    final seconds = remaining.inSeconds % 60;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          Text(
            texts["countdown_title"]!
                .replaceAll("{days}", days.toString()),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.brown.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _timeBox(days, texts["days"]!),
                _timeBox(hours, texts["hours"]!),
                _timeBox(minutes, texts["minutes"]!),
                _timeBox(seconds, texts["seconds"]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeBox(int value, String label) {
    return Column(
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.brown.shade600,
          ),
        ),
      ],
    );
  }
}

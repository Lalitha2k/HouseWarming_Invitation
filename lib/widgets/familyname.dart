import 'package:flutter/material.dart';
import 'package:housewarming_invite/utils/app_texts.dart';

class ParentsInviteText extends StatelessWidget {
  const ParentsInviteText({super.key, required this.isEnglish});

  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 1200),
      child: Column(
        children: [
          Text(
            isEnglish
                ? AppTexts.parentsInviteEnglish
                : AppTexts.parentsInviteTelugu,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isEnglish ? 16 : 15,
              height: 1.4,
              color: Colors.brown.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

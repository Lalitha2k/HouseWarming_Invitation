import 'package:flutter/material.dart';
import 'package:housewarming_invite/utils/app_text_style.dart';
import 'package:housewarming_invite/utils/app_texts.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapsButton extends StatelessWidget {
  const GoogleMapsButton({super.key, required this.isEnglish});

  final bool isEnglish;

  static const String _mapsUrl =
      'https://www.google.com/maps/search/garden+square+apartments/@12.9015574,77.5393796,17z';

  Future<void> _openMaps() async {
    final uri = Uri.parse(_mapsUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final texts = isEnglish ? AppTexts.english : AppTexts.telugu;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: _openMaps,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.brown.shade50,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.brown.shade300,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon circle
              Image.asset(
  'assets/images/home-locationn.png',
  height: 30,
  width: 30,
),

              
Expanded(
  child: Text(
    texts["open_maps"]!,
    textAlign: TextAlign.center,
    maxLines: 1,
    softWrap: false,
    overflow: TextOverflow.fade,
    style: AppTextStyle.body(
      isEnglish,
      size: 14,
      weight: FontWeight.w600,
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}

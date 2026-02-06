import 'package:flutter/material.dart';
import 'package:housewarming_invite/widgets/googleMapButton.dart';


class VenueSection extends StatelessWidget {
  final bool isEnglish;

  const VenueSection({super.key, required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withOpacity(0.92),
        image: const DecorationImage(
          image: AssetImage('assets/images/image2.jpg'),
          fit: BoxFit.cover,
          opacity: 0.15, // subtle background
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Venue title + flower
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              
              Text(
                isEnglish ? "Venue" : "వేదిక",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown.shade800,
                  letterSpacing: 1,
                ),
              ),
              
            ],
          ),

          const SizedBox(height: 14),

          const Text(
            "GARDEN SQUARE",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),

          const SizedBox(height: 6),

          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Text(
    isEnglish
        ? "No.55/1, C Block - 416 (4th Floor), Subramanyapura, Poornapragna Layout, Uttarahalli Main Road, Bengaluru - 560061"
        : "No.55/1, C Block - 416 (4వ అంతస్తు), సుబ్రమణ్యపుర, పూర్ణప్రజ్ఞ లేఅవుట్, ఉత్తరహಳ್ಳಿ మెయిన్ రోడ్, బెంగళూరు - 560061",
    textAlign: TextAlign.center,
    softWrap: true,
    style: TextStyle(
      fontSize: 15,
      height: 1.4, 
      color: Colors.brown.shade600,
    ),
  ),
),


          const SizedBox(height: 12),

          GoogleMapsButton(isEnglish: isEnglish),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promptia/util/constants.dart';

class HomeShowcase extends StatelessWidget {
  const HomeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            trendingPrompts,
            style: GoogleFonts.specialElite(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

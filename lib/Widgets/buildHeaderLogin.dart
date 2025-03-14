import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Buildheader extends StatelessWidget {
  const Buildheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Text(
          'مرحباً بك!',
          style: GoogleFonts.cairo(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
           ) ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'سجل الدخول لإدارة منطقتك',
          style: GoogleFonts.cairo(
            fontSize: 18,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
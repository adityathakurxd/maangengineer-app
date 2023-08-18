import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "MAANG Engineer",
          style: GoogleFonts.darkerGrotesque(
              fontSize: 80, fontWeight: FontWeight.bold),
        ),
        Text(
          "Practice DSA with more real-world enginnering scenarios.",
          style: GoogleFonts.instrumentSans(fontSize: 20),
        )
      ],
    );
  }
}

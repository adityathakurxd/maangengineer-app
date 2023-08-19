import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionWidget extends StatelessWidget {
  late String questionText;
  QuestionWidget({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            left: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Question:",
                style: GoogleFonts.darkerGrotesque(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              questionText,
              style: GoogleFonts.instrumentSans(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

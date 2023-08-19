import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryWidget extends StatelessWidget {
  late String titleText;
  late String storyText;

  StoryWidget({super.key, required this.titleText, required this.storyText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                titleText,
                style: GoogleFonts.darkerGrotesque(
                    fontSize: 25, fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 10,
              ),
              Text(
                storyText,
                style: GoogleFonts.instrumentSans(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

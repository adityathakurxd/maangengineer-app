import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maangengineer/screens/dsa/dsa_questions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexOfQues = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MAANG Engineer",
          style: GoogleFonts.darkerGrotesque(
              fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        DSAQuestionsList[indexOfQues].title,
                        style: GoogleFonts.darkerGrotesque(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        DSAQuestionsList[indexOfQues].story,
                        style: GoogleFonts.instrumentSans(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          SizedBox(
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
                    DSAQuestionsList[indexOfQues].ques,
                    style: GoogleFonts.instrumentSans(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Start typing your approach here:',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Submit"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Try another problem",
        onPressed: () {
          indexOfQues = Random().nextInt(5);
          print(indexOfQues);
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maangengineer/screens/learn/learn_list.dart';
import 'package:maangengineer/screens/learn/widgets/problem_widget.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Learn",
          style: GoogleFonts.darkerGrotesque(
              fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: LearnTopicsList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(LearnTopicsList[index].topicName),
            subtitle: Text(LearnTopicsList[index].topicDesc),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              for (int i = 0; i < 5; i++)
                ProblemWidget(
                    topic: LearnTopicsList[index].questions[i].topic,
                    story: LearnTopicsList[index].questions[i].story,
                    solution: LearnTopicsList[index].questions[i].solution,
                    codeSample: LearnTopicsList[index].questions[i].codeSample)
            ],
          );
        },
      ),
    );
  }
}

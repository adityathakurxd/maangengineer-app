import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';

class ProblemWidget extends StatefulWidget {
  String topic;
  String story;
  String solution;
  String codeSample;

  ProblemWidget(
      {super.key,
      required this.topic,
      required this.story,
      required this.solution,
      required this.codeSample});

  @override
  State<ProblemWidget> createState() => _ProblemWidgetState();
}

class _ProblemWidgetState extends State<ProblemWidget> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.topic),
      subtitle: Text(widget.story),
      trailing: Icon(
        _customTileExpanded
            ? Icons.arrow_drop_down_circle
            : Icons.arrow_drop_down,
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(widget.solution),
        ),
        HighlightView(
          // The original code to be highlighted
          widget.codeSample,

          // Specify language
          // It is recommended to give it a value for performance
          language: 'c',

          // Specify highlight theme
          // All available themes are listed in `themes` folder
          // theme: githubTheme,

          // Specify padding
          padding: const EdgeInsets.all(12),

          // Specify text style
          textStyle: const TextStyle(
            fontSize: 16,
          ),
        )
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {
          _customTileExpanded = expanded;
        });
      },
    );
  }
}

class LearnModel {
  String topicName;
  String topicDesc;
  List<Questions> questions;

  LearnModel(
      {required this.topicName,
      required this.topicDesc,
      required this.questions});

  // LearnModel.fromJson(Map<String, dynamic> json) {
  //   topicName = json['topicName'];
  //   topicDesc = json['topicDesc'];
  //   if (json['questions'] != null) {
  //     questions = <Questions>[];
  //     json['questions'].forEach((v) {
  //       questions!.add(Questions.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['topicName'] = topicName;
  //   data['topicDesc'] = topicDesc;
  //   if (questions != null) {
  //     data['questions'] = questions!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Questions {
  String topic;
  String story;
  String solution;
  String codeSample;

  Questions(
      {required this.topic,
      required this.story,
      required this.solution,
      required this.codeSample});

  // Questions.fromJson(Map<String, dynamic> json) {
  //   topic = json['topic'];
  //   story = json['story'];
  //   solution = json['solution'];
  //   codeSample = json['codeSample'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['topic'] = topic;
  //   data['story'] = story;
  //   data['solution'] = solution;
  //   data['codeSample'] = codeSample;
  //   return data;
  // }
}

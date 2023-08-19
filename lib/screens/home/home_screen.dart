import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maangengineer/screens/dsa/dsa_questions_list.dart';
import 'package:maangengineer/screens/home/widgets/story_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexOfQues = 0;
  final logicInputController = TextEditingController();

  bool isLoadingResponse = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    logicInputController.dispose();
    super.dispose();
  }

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
      body: ListView(
        children: [
          StoryWidget(
              titleText: DSAQuestionsList[indexOfQues].title,
              storyText: DSAQuestionsList[indexOfQues].story),
          // QuestionWidget(questionText: DSAQuestionsList[indexOfQues].ques),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                controller: logicInputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start typing your approach here...',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoadingResponse = true;
                  });
                  final user = FirebaseAuth.instance.currentUser;

                  var ref = await FirebaseFirestore.instance
                      .collection("users")
                      .doc(user!.uid)
                      .collection("chats")
                      .add({
                    "prompt":
                        "You are a tech interviewer talking to candidate about a problem ${DSAQuestionsList[indexOfQues].ques} and they answer their approach to solving as ${logicInputController.text}. Without any other default text provide a clear reason how their approach is good or how it can be improved."
                  });
                  // CollectionReference responsesCollectionReference = FirebaseFirestore.instance.collection('users').doc(userUID).collection("chats");
                  final docRef = FirebaseFirestore.instance
                      .collection("users")
                      .doc(user.uid)
                      .collection("chats")
                      .doc(ref.id);

                  print("REF ID HEREEEEEE");
                  print(ref.id);

                  Future.delayed(const Duration(seconds: 10), () {
                    docRef.get().then(
                      (DocumentSnapshot doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        print(data);
                        print(data['response']);

                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('About your approach'),
                            content: Text(data['response']),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                      onError: (e) => print("Error getting document: $e"),
                    );
                  });
                  setState(() {
                    isLoadingResponse = false;
                  });
                },
                child: isLoadingResponse
                    ? const CircularProgressIndicator()
                    : const Text("Submit")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Try another problem",
        onPressed: () {
          indexOfQues = Random().nextInt(15);
          print(indexOfQues);
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class DSAExplanationScreen extends StatelessWidget {
//   late DocumentSnapshot documentReference;

//   DSAExplanationScreen({Key? key, required documentReference})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: documentReference,
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text("Something went wrong :(");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return const Text("AI ghosted you! Haha.");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           return Text(data['response']);
//         }

//         return const Text("loading");
//       },
//     );
//   }
// }

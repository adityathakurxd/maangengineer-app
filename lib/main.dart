import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maangengineer/firebase_options.dart';
import 'package:maangengineer/rootwidget.dart';

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const RootWidget(),
//     ),
//   ],
// );

void main() async {
  // usePath
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'MAANG Engineer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const RootWidget(),
    );
  }
}

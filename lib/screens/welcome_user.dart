import 'package:flutter/material.dart';
import 'dart:async';

import 'package:maangengineer/models/user_model.dart';
import 'package:maangengineer/screens/home/home_screen.dart';

class WelcomeUser extends StatefulWidget {
  UserData userData;

  WelcomeUser({super.key, required this.userData});

  @override
  _WelcomeUserState createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    print("Done");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                        child: Image.network(widget.userData.imgurl,
                            width: 100, height: 100, fit: BoxFit.cover)),
                    const SizedBox(height: 20),
                    const Text('Welcome,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center),
                    Text(widget.userData.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    const SizedBox(height: 20),
                    const Center(child: CircularProgressIndicator())
                  ],
                ))));
  }
}

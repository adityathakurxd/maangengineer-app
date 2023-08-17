import 'package:flutter/material.dart';
import 'package:maangengineer/screens/auth/auth_screen.dart';
import 'package:maangengineer/screens/home/home_screen.dart';
import 'package:maangengineer/services/firebase_auth.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  FirebaseAuthService authService = FirebaseAuthService();

  @override
  void initState() {
    super.initState();
    checkCurrentuser();
  }

  checkCurrentuser() async {
    //Checks if the user is logged in
    bool retVal = await authService.checkIfUserIsSignedIn();
    if (retVal == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const AuthScreen()),
          (route) => false);
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Center(
            child: CircularProgressIndicator(
      color: Colors.white,
    )));
  }
}

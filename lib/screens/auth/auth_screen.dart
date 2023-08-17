import 'package:flutter/material.dart';
import 'package:maangengineer/screens/welcome_user.dart';
import 'package:maangengineer/services/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  FirebaseAuthService authService = FirebaseAuthService();
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(50),
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [kPrimaryRed, kPrimaryBlue]),
            // ),
            child: Column(children: [
              const Spacer(),
              const Text(
                'SRM One',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 40.0),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    )),
                onPressed: () async {
                  isClicked = true;
                  setState(() {});
                  var user = await authService.signInWithGoogle();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomeUser(
                        userData: user,
                      ),
                    ),
                  );
                },
                // color: isUserSignedIn ? Colors.green : Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 26,
                          width: 26,
                          child: Image.asset("assets/images/google.png")),
                      const SizedBox(width: 10),
                      Text(
                        // isUserSignedIn ? 'You\'re logged in with Google' :
                        isClicked ? 'Signing you in..' : 'Login with Google',
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ])));
  }
}

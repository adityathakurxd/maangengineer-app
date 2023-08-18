import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maangengineer/screens/auth/app_info.dart';
import 'package:maangengineer/screens/welcome_user.dart';
import 'package:maangengineer/services/firebase_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: MediaQuery.of(context).size.width < 600
            ? const Column(children: [
                AppInfo(),
                SizedBox(
                  height: 40,
                ),
                GoogleSignInButton()
              ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 600,
                    child: const AppInfo(),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const GoogleSignInButton())
                ],
              ),
      ),
    );
  }
}

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  FirebaseAuthService authService = FirebaseAuthService();
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(maximumSize: const Size.fromHeight(40)
          // backgroundColor:
          //     MaterialStateProperty.all(Colors.white),
          // shape: MaterialStateProperty.all(
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(40),
          //   ),
          // )
          ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // SizedBox(
          //     height: 26,
          //     width: 26,
          //     child: Image.asset(
          //         "assets/images/google.png")),

          Text(
            // isUserSignedIn ? 'You\'re logged in with Google' :
            isClicked ? 'Signing you in..' : 'Get started with Google',
            style: GoogleFonts.instrumentSans(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

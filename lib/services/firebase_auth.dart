import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId:
          "301420763380-af0uvildscdg0m2h55lki4ge4lt2bl27.apps.googleusercontent.com");
  final CollectionReference _userData =
      FirebaseFirestore.instance.collection('user');

  Future<bool> checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();
    return userSignedIn;
  }

  getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  getCurrentUID() {
    User? user = _firebaseAuth.currentUser;
    return _userFromFirebase(user).uid;
  }

  UserData _userFromFirebase(User? user) {
    return UserData(
        uid: user!.uid,
        name: user.displayName ?? 'Anonymous',
        email: user.email ?? '',
        imgurl: user.photoURL ?? '');
  }

  Stream<UserData?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserData> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<UserData> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await _firebaseAuth.signInWithCredential(credential);
    //Add user to Firestore database
    await _userData
        .doc(authResult.user!.uid)
        .set(_userFromFirebase(authResult.user).toMap());
    //Add email to send in blue
    // await addEmailToContacts(authResult.user!.email ?? 'notspecified@gmail.com',
    //     authResult.user!.displayName ?? 'Anonymous');
    return _userFromFirebase(authResult.user);
  }

  // Future<UserData> signInWithApple({List<Scope> scopes = const []}) async {
  //   // 1. perform the sign-in request
  //   final result = await TheAppleSignIn.performRequests(
  //       [AppleIdRequest(requestedScopes: scopes)]);
  //   // 2. check the result
  //   switch (result.status) {
  //     case AuthorizationStatus.authorized:
  //       final appleIdCredential = result.credential!;
  //       final oAuthProvider = OAuthProvider('apple.com');
  //       final credential = oAuthProvider.credential(
  //         idToken: String.fromCharCodes(appleIdCredential.identityToken!),
  //         accessToken:
  //             String.fromCharCodes(appleIdCredential.authorizationCode!),
  //       );
  //       final userCredential =
  //           await _firebaseAuth.signInWithCredential(credential);
  //       final firebaseUser = userCredential.user!;

  //       if (scopes.contains(Scope.fullName)) {
  //         final fullName = appleIdCredential.fullName;
  //         if (fullName != null &&
  //             fullName.givenName != null &&
  //             fullName.familyName != null) {
  //           final displayName = '${fullName.givenName} ${fullName.familyName}';
  //           await firebaseUser.updateDisplayName(displayName);
  //         }
  //       } else {
  //         await firebaseUser.updateDisplayName(appleIdCredential.user);
  //       }
  //       return _userFromFirebase(firebaseUser);
  //     case AuthorizationStatus.error:
  //       throw PlatformException(
  //         code: 'ERROR_AUTHORIZATION_DENIED',
  //         message: result.error.toString(),
  //       );

  //     case AuthorizationStatus.cancelled:
  //       throw PlatformException(
  //         code: 'ERROR_ABORTED_BY_USER',
  //         message: 'Sign in aborted by user',
  //       );
  //     default:
  //       throw UnimplementedError();
  //   }
  // }

  Future<void> signOut() async {
    await _googleSignIn.signOut();

    return _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    await _firebaseAuth.currentUser?.delete();
  }

  // //SEND IN BLUE EMAIL MARKETING
  // Future<int> addEmailToContacts(String email, String name) async {
  //   var url = Uri.parse('https://api.sendinblue.com/v3/contacts');
  //   Map<String, String> headers = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'api-key': sendInBlueAPIKEY
  //   };
  //   final details = jsonEncode({
  //     "email": "$email",
  //     "listIds": [8],
  //     "attributes": {"FIRSTNAME": "$name"}
  //   });
  //   var response = await http.post(url, headers: headers, body: details);
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   return response.statusCode;
  // }
}

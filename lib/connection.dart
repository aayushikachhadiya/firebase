import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(
    home: google_auth(),debugShowCheckedModeBanner:false,
  ));
}
class google_auth extends StatefulWidget {
  const google_auth({super.key});

  @override
  State<google_auth> createState() => _google_authState();
}

class _google_authState extends State<google_auth> {
  final user = FirebaseAuth.instance.currentUser;
  Future<UserCredential?> signInWithGoogle() async {

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // Handle the case where the user cancels the sign-in
           return Future.error("Failed");
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      if (googleAuth == null && googleAuth!.accessToken == null && googleAuth.idToken == null) {
        // Handle the case where authentication details are not available
        return Future.error("Failed");
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken!,
        idToken: googleAuth.idToken!,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);

  }  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (user != null) {
      // Name, email address, and profile photo URL
      String name = user!.displayName.toString();
      String email = user!.email.toString();
      WidgetsBinding.instance.addPostFrameCallback((_){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return login(name,email);
        },));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Column(children: [

      ElevatedButton(
        onPressed: () async {
          signInWithGoogle().then((value) {

                 String name,email;
                   name=user!.displayName.toString();
                   email=user!.email.toString();
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                   return login(name,email);
                 },));

          });

        },
        child: Text("Login"),
      ),    ]),
    );
  }
}


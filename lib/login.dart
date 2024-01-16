import 'package:firebase/connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  String name;
  String email;
  login(this.name,this.email);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text("${widget.name}"),
        Text("${widget.email}"),
        ElevatedButton(onPressed: () async {
        await   GoogleSignIn().signOut();
         await   FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return google_auth();
          },));
        }, child: Text("Log out"))
      ]),
    );
  }
}

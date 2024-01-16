import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(
    home: otp(),debugShowCheckedModeBanner:false,
  ));
}
class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController t1=new TextEditingController();
  TextEditingController t2=new TextEditingController();
  String v_id="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextField(
          controller: t1,
        ),
        ElevatedButton(onPressed: () async {
          FirebaseAuth auth = FirebaseAuth.instance;
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: '+91${t1.text}',
            verificationCompleted: (PhoneAuthCredential credential) async {
              await auth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e) {
              if (e.code == 'invalid-phone-number') {
                print('The provided phone number is not valid.');
              }
            },
            codeSent: (String verificationId, int? resendToken) {
              v_id=verificationId;
              setState(() {

              });
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
        }, child: Text("Send otp")),
        TextField(
          controller: t2,
        ),
        ElevatedButton(onPressed: () async {
          FirebaseAuth auth = FirebaseAuth.instance;
          String smscode='${t2.text}';
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: v_id, smsCode: smscode);
          await auth.signInWithCredential(credential);

        }, child: Text("Verify OTP")),

      ]),
    );
  }
}

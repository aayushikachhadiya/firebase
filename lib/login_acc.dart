import 'package:firebase/new_acc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: login_acc(),
    debugShowCheckedModeBanner: false,
  ));
}

class login_acc extends StatefulWidget {
  const login_acc({super.key});

  @override
  State<login_acc> createState() => _login_accState();
}

class _login_accState extends State<login_acc> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Color.fromRGBO(1, 11, 43, 300),
        ),
        backgroundColor: Color.fromRGBO(1, 11, 43, 200),
        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text("User Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 50),
                      height: 3,
                      width: double.infinity,
                      color: Colors.white,
                    )),
                    Icon(Icons.account_circle, size: 100, color: Colors.white),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(right: 50),
                      height: 3,
                      width: double.infinity,
                      color: Colors.white,
                    )),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 3)),
                  child: TextField(
                    controller: t1,
                    decoration: InputDecoration(
                      label: Text("Enter username"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 3)),
                  child: TextField(
                    controller: t2,
                    decoration: InputDecoration(
                      label: Text("Enter Password"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Forget Password",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 100, right: 100),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(3)),
                  margin: EdgeInsets.only(
                      left: 50, bottom: 10, top: 215, right: 50),
                  height: 3,
                  width: double.infinity,

                )),

               InkWell(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return new_acc();
                   },));
                 },
                 child: Text(
                  "Create New Account",
                  style: TextStyle(fontSize: 20, color: Colors.white),

            ),
               )
              ],
            )));
  }
}

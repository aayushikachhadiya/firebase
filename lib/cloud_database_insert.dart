import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cloud_database_view.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MaterialApp(
    home: insert(),debugShowCheckedModeBanner:false,
  ));
}
class insert extends StatefulWidget {
String ?id;
Map<String ,dynamic> ?data;
insert([this.id,this.data]);

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.id!=null)
      {
        t1.text=widget.data!['name'];
        t2.text=widget.data!['contact'];
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          ElevatedButton(onPressed: () {
          if(widget.id!=null)
            {
              users
                  .doc(widget.id)
                  .update({'name': t1.text,'contact':t2.text})
                  .then((value) => print("User Updated"))
                  .catchError((error) => print("Failed to update user: $error"));
            }else
              {
                users
                    .add({
                  'name': t1.text, // John Doe
                  'contact': t2.text, // Stokes and Sons

                })
                    .then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"));

              }
          }, child: Text("Submit")),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return view();
            },));

          }, child: Text("View"))
        ],
      ) ,
    );
  }
}

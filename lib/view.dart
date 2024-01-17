import 'package:firebase/realtime_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class view1 extends StatefulWidget {
  const view1({super.key});

  @override
  State<view1> createState() => _view1State();
}

class _view1State extends State<view1> {
  DatabaseReference starCountRef = FirebaseDatabase.instance.ref('realtime');
  List id_key=[];
  List val=[];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(stream:starCountRef.onValue ,builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.active)
        {
          final data = snapshot.data!.snapshot.value;
          Map m=data as Map;
          id_key=m.keys.toList();
          val=m.values.toList();
        }
        return ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${val[index]['name']}"),
              subtitle: Text("${val[index]['contact']}"),
            ),
          );
        },);

      },),
    ), onWillPop: ()async {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return realtime_database();
      },));
      return true;
    },);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/cloud_database_insert.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}
class _viewState extends State<view> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['contact']),
                trailing: Wrap(children: [
                  IconButton(onPressed: () {
                    users
                        .doc(document.id)
                        .delete()
                        .then((value) => print("User Deleted"))
                        .catchError((error) => print("Failed to delete user: $error"));
                  }, icon: Icon(Icons.delete)),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return insert(document.id,data);
                    },));
                  }, icon: Icon(Icons.edit)),
                ]),
              );
            }).toList(),
          );
        },
      ),
    ), onWillPop: () async{

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return insert();

      },));
      return true;
    },);
  }
}

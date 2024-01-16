import 'package:flutter/material.dart';

class new_acc extends StatefulWidget {
  const new_acc({super.key});

  @override
  State<new_acc> createState() => _new_accState();
}

class _new_accState extends State<new_acc> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  TextEditingController t4=TextEditingController();
  TextEditingController t5=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Ragistration"),
        backgroundColor: Color.fromRGBO(1, 11, 43, 300),
      ),
      body:SingleChildScrollView(child: Container(alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50),
        child: Column(children: [
          Container(alignment: Alignment.center,
            child: Text("User Ragistration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                label: Text("Enter Name"),
              ),
            ),
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
                label: Text("Enter Contact"),
              ),
            ),
          ),
          Container(
            margin:
            EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 3)),
            child: TextField(
              controller: t3,
              decoration: InputDecoration(
                label: Text("Enter username"),
              ),
            ),
          ),
          Container(
            margin:
            EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 3)),
            child: TextField(
              controller: t4,
              decoration: InputDecoration(
                label: Text("Enter Password"),
              ),
            ),
          ),
          Container(
            margin:
            EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 3)),
            child: TextField(
              controller: t5,
              decoration: InputDecoration(
                label: Text("Enter City"),
              ),
            ),
          ),
          Container(
              height: 40,
              decoration: BoxDecoration(
                  color:  Color.fromRGBO(1, 11, 43, 300),
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.only(left: 100, right: 100),
              child: Text(
                "Upload image",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
          Container(
              height: 40,
              decoration: BoxDecoration(
                  color:  Color.fromRGBO(1, 11, 43, 300),
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.only(left: 100, right: 100),
              child: Text(
                "Ragister",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),

        ]),
      ))
    );
  }
}

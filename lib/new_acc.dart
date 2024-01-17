import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
  XFile? photo;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Use Ragistration"),
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
          InkWell(onTap: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text("Choosee image "),
                actions: [
                  TextButton(onPressed: () async {
                    photo = await picker.pickImage(source: ImageSource.camera);
                    // Navigator.of(context);
                    Navigator.pop(context);
                    setState(() {

                    });

                  }, child: Text("Camera")),
                  TextButton(onPressed: () async {
                    photo = await picker.pickImage(source: ImageSource.gallery);
                    Navigator.pop(context);
                    setState(() {

                    });

                  }, child: Text("Gallery")),
                ],
              );
            },);
          },
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color:  Color.fromRGBO(1, 11, 43, 300),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.only(left: 100, right: 100,bottom: 10),
                child: Text(
                  "Upload image",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
          InkWell(
            onTap: () async {
              String name=t1.text;
              String contact=t2.text;
              String username=t3.text;
              String password=t4.text;
              String city=t5.text;
              String image;
              var url;
              image=base64Encode(await photo!.readAsBytes());
              url = Uri.parse('https://apidevlopment.000webhostapp.com/api_new_acc.php');
              // var response = await http.get(url);
              var response = await http.post(url,body: {
                'name':'$name',
                'contact':'$contact',
                'username':'$username',
                'password':'$password',
                'city':'$city',
                'image':'$image',
                'image_name':'${photo!.name}',
              });
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');
              Map m = jsonDecode(response.body);
             if(m['res']=="olredy exits this email")
               {
                 showDialog(context: context, builder: (context) {
                   return AlertDialog(
                     title: Text("olredy exits this email"),
                   );
                 },);
               }
              print(m);
            },
            child: Container(
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
          ),

        ]),
      ))
    );
  }
}

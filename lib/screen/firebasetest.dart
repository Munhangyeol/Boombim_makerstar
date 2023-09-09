import 'dart:async';
import 'package:boombim_makerstar/screen/boombimscreen.dart';
import 'package:boombim_makerstar/screen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseTest extends StatefulWidget{
  const FirebaseTest ({Key?key}):super(key:key);
  @override
  _FirebaseTest createState()=>_FirebaseTest();
  
}
class _FirebaseTest extends State<FirebaseTest>{
  final firestore=FirebaseFirestore.instance;
  String Url="AA";
  String url='aa';
  getData()
  async{


    var a = await FirebaseFirestore.instance.collection('photo').doc('YbfHZRp7aykZL12XzFnx').get().
    then((DocumentSnapshot ds){
      final data =ds.data() as Map<String,dynamic>;
      setState(() {
        url=data["url"];
      });

    });
    print(a.data());
    Url=a.data[''];
    print(Url);

  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        child:Image.network("$url"),
      )
      
    );
  }
  
}
import 'dart:async';
import 'package:boombim_makerstar/screen/boombimscreen.dart';
import 'package:boombim_makerstar/screen/mainscreen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({Key?key}):super(key:key);
  @override
  _SplashScreenState createState()=>_SplashScreenState();


}
class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => MainScreen(),
      )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(

        child:Image.asset('assets/images/boombim.png'),
      ),
    );

  }

}

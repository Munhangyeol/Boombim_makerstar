import 'dart:async';
import 'package:boombim_makerstar/screen/boombimscreen.dart';
import 'package:boombim_makerstar/screen/firebasetest.dart';
import 'package:boombim_makerstar/screen/mainscreen.dart';
import 'package:transition/transition.dart';
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
    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context,PageRouteBuilder(
          pageBuilder: (context,animation1,animation2)=>MainScreen(),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context,animation1,animation2,child){
            return FadeTransition(opacity: animation1,child: child);
        }
      )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      body: Center(

        child:Image.asset('assets/images/boombim.png',height: size.height*0.7,width: size.width*0.7,),
      ),
    );

  }

}

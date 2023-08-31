import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';
class BoombimScreen extends StatefulWidget {
  const BoombimScreen({Key? key}) : super(key: key);

  @override
  _BoombimScreenState createState() => _BoombimScreenState();
}

class _BoombimScreenState extends State<BoombimScreen> {
  double percentValue=0.5;
  String phoneNumber="02-1234-5678";
  String timeCurrentDay="10:00 ~ 18:00";
  int totalTableNumber=30;
  int occupyTableNumber=10;
  bool isVisible=false;

  void increaseProgress(){
    setState(() {     //setState를 이용해서 상태변경을 알리고 UI를 다시 그려줌.
      percentValue+=0.1;  //별표시를 클릭시에 혼잡도가 증가함.
      if(percentValue>=1){
        percentValue=0.1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(

                width: size.width,
                height: size.height * 0.35,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset('assets/images/americano.jpg',
                              width: size.width, height: size.height * 0.35,
                          fit: BoxFit.cover,),
                          Image.asset('assets/images/caffu.jpg',
                              width: size.width, height: size.height * 0.35),
                          Image.asset('assets/images/latte.jpg',
                              width: size.width, height: size.height * 0.35),
                        ],
                      ),
                    ),
                    Positioned(
                      left: size.width * 0.02,
                      top: 0,
                      bottom: size.height*0.28,
                      child: FloatingActionButton.small(
                        backgroundColor: Color(0xffC7C7C7),
                        onPressed: () {},
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Positioned(
                      right: size.width * 0.02,
                      top: 0,
                      bottom: size.height*0.28,
                      child: FloatingActionButton.small(
                        backgroundColor: Color(0xffC7C7C7),
                        onPressed: () {},
                        child: Icon(Icons.home),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height*0.08,

                width: size.width,
                child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('유캔두잇 세종대점',style: TextStyle( fontFamily: 'IBM_Bold',fontSize: 26,
                         color:Colors.black,fontWeight: FontWeight.w700),
                        ),
                  Text('서울 광진구 능동로 209 세종대학교 광개토관 15층',style: TextStyle(fontSize: 13,
                    fontFamily: 'InterSemiBold',color:Color(0xff5E5E5E),fontWeight: FontWeight.w500)
                  ),



                      ],
                    ),

                    IconButton(
                        onPressed: increaseProgress, icon: Icon(


                        Icons.star,
                            size:35.0,
                      color:Color(0xffFFCD4A)
                    )
                    ),
                  ]
                ),



              ),
              Container(
                  width: size.width,
                  height: 0.5,
                  color:Color(0xff767676)
              ),
              Container(
                width: size.width,
                height: 5,
              ),
              Container(

                width: size.width,
                height: size.height*0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}
                        , icon: Icon(Icons.home,size: 25,),),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.coffee,size: 25),color:Color(0xffC7C7C7)),
                    IconButton(onPressed: (){},
                    icon:Icon(Icons.rate_review,size: 25),color:Color(0xffC7C7C7))
                  ],
                ),
              ),
              Container(
                  width: size.width,
                  height: 5,
                  color:Color(0xffF2F2F2)
              ),

              Container(

                width: size.width,
                height: size.height*0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:size.width,
                      height: size.height*0.03,

                    ),
                    Text("    혼잡도",style: TextStyle(fontSize: 19,fontFamily: "IBM_Bold",
                        color: Colors.black,
                        fontWeight:FontWeight.w600)),
                    Container(
                      width: size.width,
                      height: size.height*0.02,
                    ),
                    LinearPercentIndicator(

                      alignment: MainAxisAlignment.center,
                      percent: percentValue,
                      lineHeight: 5,
                      backgroundColor: Color(0xFFD9D9D9),
                      progressColor: Color(0xFFFFCD4A),
                      width: size.width*0.95,
                      ),
                    Container(
                      width: size.width,
                      height: size.height*0.01,
                    ),
                    Text("     테이블 $totalTableNumber개 중 $occupyTableNumber개 사용중",style: TextStyle(fontWeight:
                    FontWeight.w500,fontSize: 14,color: Color(0xff949494)),

                    ),


                  ],
                ),

              ),
              Container(
                width:size.width,
                height: size.height*0.15,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                  width:size.width,
                  height: size.height*0.04,

                ),
                    Text("    영업시간",style: TextStyle(fontSize: 19,fontFamily: "IBM_Bold",
                        color: Colors.black,
                        fontWeight:FontWeight.w600)),
                    Container(
                      width: size.width,
                      height: size.height*0.005,
                    ),
                    Row(

                      children:[
                        Text("     $timeCurrentDay",style: TextStyle(fontWeight:
                        FontWeight.w600,fontSize: 16,color: Color(0xff949494)),

                        ),

                        IconButton(onPressed: () {
                         showModalBottomSheet(context: context,
                             builder: (BuildContext context){
                           return Container(
                             height: 300, // 모달 높이 크기
                             margin: const EdgeInsets.only(
                               left: 25,
                               right: 25,
                               bottom: 40,
                             ), // 모달 좌우하단 여백 크기
                             decoration: const BoxDecoration(
                               color: Colors.white, // 모달 배경색
                               borderRadius: BorderRadius.all(
                                 Radius.circular(20), // 모달 전체 라운딩 처리
                               ),
                             ),
                             child:Center(

                               child:SingleChildScrollView(
                                   child :DefaultTextStyle(
                                     child:Text("월:    10AM ~ 6PM\n화:    10AM ~ 6PM\n"
                                         "수:    10AM ~ 6PM\n목:    10AM ~ 7PM\n금:    10AM ~ 7PM\n토:    10AM ~ 8PM"
                                         "\n일:    10AM ~ 8PM\n",


                                     ),
                                     style:TextStyle(color: Color(0xff949494) ,fontSize: 18,fontWeight: FontWeight.w500,
                                     fontFamily: "IBM_Bold"),  )
                               ),
                             ),
                           );

                             },
                           backgroundColor: Colors.transparent,);
                        }, icon: Icon(Icons.expand_more))
                      ]



                    ),

]
                ),
              ),
              Container(
                width: size.width,
                height: size.height*0.02,
              ),
              Container(
                width:size.width,
                height:size.height*0.1,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
              Text("    전화번호",style: TextStyle(fontSize: 19,fontFamily: "IBM_Bold",
                  color: Colors.black,
                  fontWeight:FontWeight.w600)),
              Container(
                width: size.width,
                height: size.height*0.02,
              ),
              Text("     $phoneNumber",style: TextStyle(fontWeight:
              FontWeight.w600,fontSize: 16,color: Color(0xff949494)),

              ),
                ]
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void showToast(BuildContext context) {
  OverlayState overlayState = Overlay.of(context);

  OverlayEntry overlayEntry = OverlayEntry(builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.5,
      left: MediaQuery.of(context).size.width * 0.1,
      right: MediaQuery.of(context).size.width * 0.1,
      child:ClipRRect(
        borderRadius: BorderRadius.circular(20),
      child :Container(
          color :Colors.white,
          height :MediaQuery.of(context).size.height *0.3,
          padding :EdgeInsets.symmetric(horizontal :10),
          child:Center(

          child:SingleChildScrollView(
          child :DefaultTextStyle(
            child:Text("월: 10AM ~ 6PM\n화: 10AM ~ 6PM\n"
                "수: 10AM ~ 6PM\n목: 10AM ~ 7PM\n금: 10AM ~ 7PM\n토: 10AM ~ 8PM\n일: 10AM ~ 8PM\n",


               ),
            style:TextStyle(color: Color(0xff949494) ,fontSize: 18,fontWeight: FontWeight.w500),  )
      ),
          ),
      ),
      ),
  ));

  overlayState.insert(overlayEntry);

  Future.delayed(Duration(seconds :10)).then((_) { // 지정된 시간 후에 자동으로 사라짐
    overlayEntry.remove();
  });
}
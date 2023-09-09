import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'boombimscreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
class MainScreen extends StatefulWidget{
  const MainScreen({Key?key}):super(key:key);
  @override
  _MainScreenState createState()=>_MainScreenState();


}

class _MainScreenState extends State<MainScreen>{
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body:SafeArea(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
            children: [
              Container(
                width: size.width,
                height: size.height*0.01,
              ),
              Row(
                children: [

                  Text("  Boom Bim",style: TextStyle(fontSize: 25,
                      color: Colors.black,fontFamily: "IBM_Bold",),),
                  Spacer(),
                  Container(
                    child:
                     Row(
                       children: [
                         IconButton(onPressed: (){},
                             icon: Icon(Icons.account_circle,size:30),
                         color:Color(0xFFFFCD4A),
                         ),
                         IconButton(onPressed: (){},
                           icon: Icon(Icons.notification_add,size:30),
                           color:Color(0xFFFFCD4A),
                           padding:EdgeInsets.only()
                         )
                       ],
                     ),
                  ),

                ],
              ),
              Container(
                height: 220,
              child:PageView(
                scrollDirection: Axis.horizontal,


                  children: [
                    Stack(

                    children:[

                      Image.asset("assets/images/teralosa.jpg",
                      width: size.width,height: 220,),

                      Positioned(
                        left: size.width*0.3,
                        child: Text("테라로사 - 서울 성수",
                          style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontFamily: "IBM_Bold"),),
                      ),
                    ],
                    ),
                    Stack(
                      children:[
                    Image.asset("assets/images/starbucks.jpg",
                      width: size.width,height: 220,),
                        Positioned(
                          left: size.width*0.3,
                          child: Text("스타벅스 - 경기 오산",
                            style: TextStyle(color: Colors.white,
                                fontSize: 16,fontWeight: FontWeight.w700,
                                fontFamily: "IBM_Bold"),),
                        ),]
                    ),
                    Stack(
                        children:[
                          Image.asset("assets/images/cafe-gondry.jpg",
                            width: size.width,height: 220,),
                          Positioned(
                            left: size.width*0.3,
                            child: Text("공드리 - 서울 종로",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 16,fontWeight: FontWeight.w700,
                                  fontFamily: "IBM_Bold"),),
                          ),]
                    ),

                  ],

              ),
              ),
              Container(
                height: size.height*0.005,
              ),
              Row(
                children:[
                  Text("    세종대학교",style: TextStyle(fontFamily:
                  "IBM_SemiBold",color:Colors.black,
                  fontSize: 21),),
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context,
                      builder: (BuildContext context){
                        return Container(
                          height: 400, // 모달 높이 크기
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 30,
                          ), // 모달 좌우하단 여백 크기
                          decoration: const BoxDecoration(
                            color: Colors.white, // 모달 배경색
                            borderRadius: BorderRadius.all(
                              Radius.circular(20), // 모달 전체 라운딩 처리
                            ),
                          ),
                          child:Center(


                          ),
                        );

                      },
                      backgroundColor: Colors.transparent,);
                  }, icon: Icon(Icons.expand_more,
                  size:20),),
              ]
              ),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [

                    SizedBox(
                      width:size.width*0.9,

                    child:ClipRRect(


                        borderRadius: BorderRadius.circular(10),
                        child:Container(
                          width:size.width*0.9,
                          height: 80,
                          color: Colors.white,
                        child:OutlinedButton(


                            //width의 0.9, height의 0.12를 사용함.

                              child:Row(
                                children: [
                                  Image.asset("assets/images/ucandoeat.jpg"),
                                  Container(width: size.width*0.05),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),

                                      Text("유캔두잇 세종대점",style: TextStyle(color: Colors.black,
                                          fontSize: 18,fontFamily: "IBM_SemiBold"),),
                                      Text("광개토관 15층",style: TextStyle(color: Colors.grey,
                                          fontSize: 16,fontFamily: "IBM_SemiBold"),),

                                      Text("10:00 ~ 18:00 ",style: TextStyle(color: Colors.black,
                                          fontSize: 16,fontFamily: "IBM_SemiBold"),),

                                    ],
                                  )

                                ],
                              )

                          ,


                          onPressed: () {

                          Navigator.push(context, PageRouteBuilder(
                            transitionsBuilder: (context,animation1,animation2,child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(1.0, 0.0),
                                  end: Offset(0.0, 0.0),
                                ).animate(animation1),
                                child: child,

                              );
                            },
                              pageBuilder: (context,animation1,animation2)=>BoombimScreen(),
                          transitionDuration: Duration(milliseconds: 150),

                          )
                          );
                        },


                        )
                        ),

                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width:size.width*0.9,
                      height: 80,
                      color: Colors.white,
                    child:ClipRRect(

                        borderRadius: BorderRadius.circular(10),
                        child:OutlinedButton(onPressed: () {print("AA");  },


                            child:Row(
                              children: [
                                Image.asset("assets/images/Pandorothy.jpg"),
                                Container(width: size.width*0.05),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("팬도로시 세종대점",style: TextStyle(color: Colors.black,
                                        fontSize: 18,fontFamily: "IBM_SemiBold"),),
                                    Text("학생회관 1층",style: TextStyle(color: Colors.grey,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                    Text("09:00 ~ 19:00 ",style: TextStyle(color: Colors.black,
                                        fontSize:16,fontFamily: "IBM_SemiBold"),),
                                  ],
                                )

                              ],
                            )




                        )

                    ),
      ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width:size.width*0.9,
                      height: 80,
                      color: Colors.white,
                    child:ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:OutlinedButton(onPressed: () {print("AA");  },


                            child:Row(
                              children: [
                                Image.asset("assets/images/cafedic.png"),
                                Container(width: size.width*0.05),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("카페딕셔너리 광개토관점",style: TextStyle(color: Colors.black,
                                        fontSize: 18,fontFamily: "IBM_SemiBold"),),
                                    Text("광개토관 지하1층",style: TextStyle(color: Colors.grey,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                    Text("08:00 ~ 19:00 ",style: TextStyle(color: Colors.black,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                  ],
                                )

                              ],
                            )



                        )

                    ),
      ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width:size.width*0.9,
                      height: 80,
                      color: Colors.white,
                    child:ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:OutlinedButton(onPressed: () {print("AA");  },


                            child:Row(
                              children: [
                                Image.asset("assets/images/jejumol.jpg"),
                                Container(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("제주몰빵",style: TextStyle(color: Colors.black,
                                        fontSize: 18,fontFamily: "IBM_SemiBold"),),
                                    Text("학생회관 2층",style: TextStyle(color: Colors.grey,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                    Text("08:30 ~ 20:00 ",style: TextStyle(color: Colors.black,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                  ],
                                )

                              ],
                            )



                        )

                    ),
      ),


                  ],
                ),

              ),





          ]


        ),
        ),
      ),


bottomNavigationBar: Container(
  height: size.height*0.08,
  child:BottomAppBar(
    color: Color(0xFFFFCD4A),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Stack(
            children:[


              IconButton(onPressed: (){}, icon: Icon(Icons.search,
                color:Colors.grey,))

            ]
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.home,
        )),
        IconButton(onPressed: (){}, icon: Icon(Icons.map,
          color:Colors.grey,)),
      ],
    )

  )
)
    );
  }

}

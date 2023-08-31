import 'package:flutter/material.dart';

import 'boombimscreen.dart';
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
                  Padding(padding: EdgeInsets.only(left: size.width*0.35),
                  child:Container(
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
                         )
                       ],
                     ),
                  ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(

                  children: [
                    Stack(

                    children:[

                      Image.asset("assets/images/teralosa.jpg",
                      width: size.width,height: size.height*0.33,),

                      Text("  테라로사 - 서울 성수",
                        style: TextStyle(color: Colors.white,
                        fontSize: 24,fontWeight: FontWeight.w700,
                            fontFamily: "IBM_Bold"),),
                    ],
                    ),
                    Stack(
                      children:[
                    Image.asset("assets/images/starbucks.jpg",
                      width: size.width,height: size.height*0.33,),
                        Text("  스타벅스 - 경기 오산",
                          style: TextStyle(color: Colors.white,
                              fontSize: 24,fontWeight: FontWeight.w700,
                              fontFamily: "IBM_Bold"),),]
                    ),
                    Stack(
                        children:[
                          Image.asset("assets/images/cafe-gondry.jpg",
                            width: size.width,height: size.height*0.33,),
                          Text("  공드리 - 서울 종로",
                            style: TextStyle(color: Colors.white,
                                fontSize: 24,fontWeight: FontWeight.w700,
                                fontFamily: "IBM_Bold"),),]
                    ),


                  ],
                ),
              ),
              Container(
                height: size.height*0.01,
              ),
              Row(
                children:[
                  Text("  세종대학교",style: TextStyle(fontFamily:
                  "IBM_SemiBold",color:Colors.black,
                  fontSize: 22),),
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

                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:OutlinedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => BoombimScreen(),
                          )
                          );
                        }, child:Container(
                          width:size.width*0.9,
                          height: size.height*0.12,
                          color: Colors.white,
                          child:Row(
                            children: [
                              Image.asset("assets/images/ucandoeat.jpg"),
                              Container(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("유캔두잇 세종대점",style: TextStyle(color: Colors.black,
                                  fontSize: 20,fontFamily: "IBM_SemiBold"),),
                                  Text("광개토관 15층",style: TextStyle(color: Colors.grey,
                                      fontSize: 15,fontFamily: "IBM_SemiBold"),),
                                  Text("10:00 ~ 18:00 ",style: TextStyle(color: Colors.black,
                                      fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                ],
                              )
                              
                            ],
                          )
                        ),


                        )

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:OutlinedButton(onPressed: () {print("AA");  }, child:Container(
                          width:size.width*0.9,
                          height: size.height*0.12,
                          color: Colors.white,
                            child:Row(
                              children: [
                                Image.asset("assets/images/Pandorothy.jpg"),
                                Container(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("팬도로시 세종대점",style: TextStyle(color: Colors.black,
                                        fontSize: 20,fontFamily: "IBM_SemiBold"),),
                                    Text("학생회관 1층",style: TextStyle(color: Colors.grey,
                                        fontSize: 15,fontFamily: "IBM_SemiBold"),),
                                    Text("09:00 ~ 19:00 ",style: TextStyle(color: Colors.black,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                  ],
                                )

                              ],
                            )
                        ),



                        )

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:OutlinedButton(onPressed: () {print("AA");  }, child:Container(
                          width:size.width*0.9,
                          height: size.height*0.12,
                          color: Colors.white,
                            child:Row(
                              children: [
                                Image.asset("assets/images/cafedic.png"),
                                Container(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("카페딕셔너리 광개토관점",style: TextStyle(color: Colors.black,
                                        fontSize: 20,fontFamily: "IBM_SemiBold"),),
                                    Text("광개토관 지하1층",style: TextStyle(color: Colors.grey,
                                        fontSize: 15,fontFamily: "IBM_SemiBold"),),
                                    Text("08:00 ~ 19:00 ",style: TextStyle(color: Colors.black,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                  ],
                                )

                              ],
                            )
                        ),


                        )

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:OutlinedButton(onPressed: () {print("AA");  }, child:Container(
                          width:size.width*0.9,
                          height: size.height*0.12,
                          color: Colors.white,
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
                                    Text("재주몰빵",style: TextStyle(color: Colors.black,
                                        fontSize: 20,fontFamily: "IBM_SemiBold"),),
                                    Text("학생회관 2층",style: TextStyle(color: Colors.grey,
                                        fontSize: 15,fontFamily: "IBM_SemiBold"),),
                                    Text("08:30 ~ 20:00 ",style: TextStyle(color: Colors.black,
                                        fontSize: 16,fontFamily: "IBM_SemiBold"),),
                                  ],
                                )

                              ],
                            )
                        ),


                        )

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

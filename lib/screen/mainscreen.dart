import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'boombimscreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

      backgroundColor: Color(0xffF4F4F4),
      body:SafeArea(

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:Column(
            children: [
              Container(
                width: size.width,
                height: size.height*0.01,
              ),
              _TopPart(),
           // _selectPart(),

            //  _MainPicturePart(),
              _MainCaffePart(),


          ],

          ),
        ),
        ),
        bottomNavigationBar:  _BottomNavigationBar()
    );
  }
}
class _TopPart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Row(
        children: [

          Text("  Boom Bim",style: TextStyle(fontSize: 25,
            color: Colors.black,fontFamily: "IBM_Bold",),),
          Spacer(),
          Container(
            child:
            Row(
              children: [
                IconButton(onPressed: (){
                  Fluttertoast.showToast(msg: "구현중입니다!");
                  
                },
                  icon: Icon(Icons.account_circle,size:30),
                  color:Color(0xFFFFCD4A),
                ),
                IconButton(onPressed: (){ Fluttertoast.showToast(msg: "구현중입니다!");},
                    icon: Icon(Icons.notification_add,size:30),
                    color:Color(0xFFFFCD4A),
                    padding:EdgeInsets.only()
                )
              ],
            ),
          ),

        ],
      );
  }
}
class _MainPicturePart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Column(
      children: [
        Container(
          height: 220,
          child:PageView(
            scrollDirection: Axis.horizontal,


            children: [
              Stack(

                children:[

                  Center(
                  child:Image.asset("assets/images/jejumol_caffe.jpg",
                    width: size.width),
                  ),


                ],
              ),
              Stack(
                  children:[
                    Image.asset("assets/images/ucandoit_caffe.jpg",
                      width: size.width,height: 220,),
                ]
              ),
              Stack(
                  children:[
                    Image.asset("assets/images/pandorothy_caffe.jpg",
                      width: size.width,height: 220,),
                   ]
              ),

            ],

          ),
        ),
        Container(
          height: size.height*0.005,
        ),
      ],

    );
  }
}
class _selectPart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Column(


      children: [
        Positioned(child:
        Text("세종대학교",style: TextStyle(fontFamily:
        "IBM_SemiBold",color:Colors.black,
            fontSize: 21),),
        left: 0,right:size.width*0.5),
        Row(
          children: [
           Container(
             width: size.width*0.2,
             height: size.height*0.2,
             child:OutlinedButton(onPressed: () {  },
               child: Center(
                 child: Text("세종대"),
               ),

             )
           )
          ],
        )
      ],
    );
  }

}
class _MainCaffePart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Column(
      children: [
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
    SizedBox(
      width: size.width,
      height:size.height*0.03,
    ),

    SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: [

      Container(
        width:size.width*0.9,
        height: 80,

        child:ClipRRect(
         // borderRadius: BorderRadius.circular(30),

          child:OutlinedButton(

              style:OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side:BorderSide.none,

              ),
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


          ),
        ),

      ),
    SizedBox(
    height: 15,
    ),
    Container(
    width:size.width*0.9,
    height: 80,
    child:ClipRRect(

    borderRadius: BorderRadius.circular(10),
    child:OutlinedButton(
        style:OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side:BorderSide.none,

        ),
        onPressed: () { Fluttertoast.showToast(msg: "구현중입니다!");  },


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
    height: 15,
    ),
    Container(
    width:size.width*0.9,
    height: 80,

    child:ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child:OutlinedButton(
        style:OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side:BorderSide.none,

        ),
        onPressed: () { Fluttertoast.showToast(msg: "구현중입니다!"); },


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
        height: 15,
      ),
      Container(
        width:size.width*0.9,
        height: 80,

        child:ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:OutlinedButton(
                style:OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side:BorderSide.none,

                ),
                onPressed: () { Fluttertoast.showToast(msg: "구현중입니다!"); },


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
                        Text("카페딕셔너리 충무관점",style: TextStyle(color: Colors.black,
                            fontSize: 18,fontFamily: "IBM_SemiBold"),),
                        Text("충무관 1층",style: TextStyle(color: Colors.grey,
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
    height: 15,
    ),
      SizedBox(
        width:size.width*0.9,

        child:ClipRRect(


          borderRadius: BorderRadius.circular(10),
          child:Container(
              width:size.width*0.9,
              height: 80,
              color: Colors.white,
              child:OutlinedButton(
                style:OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side:BorderSide.none,

                ),


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
                  Fluttertoast.showToast(msg: "구현중입니다!");

                },


              )
          ),

        ),
      ),

      ],
    ),
    )
    ],
    );
  }
}
class _BottomNavigationBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
        height: size.height*0.08,
        child:BottomAppBar(
            color:Colors.white,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                    children:[
                      IconButton(onPressed: (){}, icon: Icon(Icons.search,
                        color:Colors.grey,))

                    ]
                ),
                IconButton(onPressed: (){}, icon: Image.asset('assets/'
                    'images/img.png'),iconSize: 30,),
                IconButton(onPressed: (){}, icon: Icon(Icons.map,
                  color:Colors.grey,)),
              ],
            )

        )
    );
  }

}

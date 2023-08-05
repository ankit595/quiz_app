import 'package:flutter/material.dart';
import 'package:quiz_app/screen/aptitude.dart';
import 'package:quiz_app/screen/flutter.dart';
import 'package:quiz_app/screen/language.dart';
import 'package:quiz_app/screen/python.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(63, 76, 120, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          side: BorderSide(style: BorderStyle.solid),
        ),
        title: Text(
          "CodeQuiz",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.03,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>QuizApp()));
            },
            child: Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(255,249,137,1),
                          Color.fromRGBO(226,183,40,1),


                        ])),
                  ),
                  Positioned(
                    top: -10,
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(image: AssetImage("assets/py.png")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40,
                        left:MediaQuery.of(context).size.width*.35),
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: MediaQuery.of(context).size.width * 0.15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: Text(
                            "Open Python Quiz",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Itim",
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),


          ), GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>FlutterQuiz()));
            },
            child: Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(84,212,228,1),
                          Color.fromRGBO(68,36,164,1),

                        ])),
                  ),
                  Positioned(
                    top: -10,
                    left: -18,
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Image(image: AssetImage("assets/flutter.png")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40,
                        left:MediaQuery.of(context).size.width*.35),
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: MediaQuery.of(context).size.width * 0.15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: Text(
                            "Open Flutter Quiz",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Itim",
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Language()));
            },
            child: Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(255,209,67,1),
                          Color.fromRGBO(255,145,83,1),

                        ])),
                  ),
                  Positioned(
                    top: -17,
                    child: SizedBox(
                      height: 140,
                      width: 180,
                      child: Image(image: AssetImage("assets/lan.png")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40,
                        left:MediaQuery.of(context).size.width*.35),
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: MediaQuery.of(context).size.width * 0.15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: Text(
                            "Open Langauge and Grammar Quiz",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Itim",
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AptiQuiz()));
            },
            child: Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(100,43,115,1) ,
                          Color.fromRGBO(4,0,4,1),

                        ])),
                  ),
                  Positioned(
                    top: -10,
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(image: AssetImage("assets/apti.png")),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40,
                        left:MediaQuery.of(context).size.width*.35),
                    child: Column(
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          size: MediaQuery.of(context).size.width * 0.15,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 100,
                          width: 300,
                          child: Text(
                            "Open Aptitude Quiz",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Itim",
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ));
  }
}
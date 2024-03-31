import 'package:flutter/material.dart';
import 'python.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    var _score = 0;
    return Scaffold(
        body: Stack(children: [
      Image(
        image: AssetImage("assets/bg.png"),
        fit: BoxFit.fitHeight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
      Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          Center(
            child: Image(image: AssetImage("assets/cup.png")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your score is: $_score',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .13),),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3), // Shadow color
                        spreadRadius: 1, // Spread radius (how far the shadow spreads)
                        blurRadius: 15, // Blur radius (how blurry the shadow is)
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Home",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3), // Shadow color
                        spreadRadius: 1, // Spread radius (how far the shadow spreads)
                        blurRadius: 15, // Blur radius (how blurry the shadow is)
                        offset: Offset(0, 3),
                      )
                    ]
                ),
                margin: EdgeInsets.all(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => QuizApp()));
                      },
                      child: Text(
                        "Restart",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    ]));
  }
}

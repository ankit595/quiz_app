import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, fontFamily: "Itim"),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>HomePage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      body:Stack(
      children: [
        Image(image: AssetImage("assets/bg.png"),
        fit: BoxFit.fitHeight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.2,
            ),
            Center(
                child: CircleAvatar(
                  backgroundColor: Color(0x6C004C),
                  radius: 130,
                  child: Image(image: AssetImage("assets/logo.png"),
                    fit: BoxFit.fill,
                  ),
                )
            )
          ],
        ),
        // Positioned(
        //   top:MediaQuery.of(context).size.height*.5,
        //   left: MediaQuery.of(context).size.width*.39,
        //   child: Text("Quix",
        //     style: TextStyle(
        //       fontSize: 40
        //     ),
        //   ),
        // )
      ],
    ),
    );
  }
}
//       Scaffold(
//         backgroundColor: Colors.purple[700],
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(top:100),
//               height: MediaQuery.of(context).size.height*.4,
//               child: AnimatedSplashScreen(
//                   duration: 3000,
//                   splash: "assets/logo.png",
//                   splashIconSize: 500,
//                   nextScreen: HomePage(),
//                   splashTransition: SplashTransition.fadeTransition,
//                   pageTransitionType: PageTransitionType.fade,
//                   backgroundColor: Colors.purple.shade700),
//             ),
//             Text("ThinkSmart",style: TextStyle(
//                 fontFamily: 'Itim',
//                 fontSize: 30,
//                 color: Colors.white,
//                fontWeight: FontWeight.bold
//             ),)
//           ],
//         ));
//   }
// }
//

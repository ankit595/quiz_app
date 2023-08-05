import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/home.dart';

class FlutterQuiz extends StatefulWidget {
  @override
  _FlutterQuizState createState() => _FlutterQuizState();
}

class _FlutterQuizState extends State<FlutterQuiz> {
  late List<QuizQuestion> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _showTimer = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadQuizData();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadQuizData() async {
    try {
      // Load the JSON file
      String jsonData =
      await rootBundle.loadString('assets/questions/flutter.json');
      print('JSON Data: $jsonData');
      // Parse the JSON data
      final List<dynamic> jsonList = json.decode(jsonData);

      // Map each JSON object to a QuizQuestion
      _questions = jsonList.map((json) {
        return QuizQuestion(
          question: json['question']??'',
          options: List<String>.from(json['options']??[]),
          correctAnswer: json['correctAnswer']??'',
        );
      }).toList();

      // Shuffle the list to get random questions
      _questions.shuffle();

      setState(() {
        // Start the timer
        _startTimer();
      });
    } catch (e) {
      // Error loading or parsing JSON
      print('Error: $e');
    }
  }

  void _startTimer() {
    const int timerDuration = 30;
    int currentTick = timerDuration;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTick--;
        if (currentTick <= 0) {
          _timer?.cancel();
          _showNextQuestion();
        }
      });
    });
  }

  List<Color> _buttonColors = List.filled(
    4,
    Color.fromRGBO(63, 76, 120, .7),
  );

  void _checkAnswer(String selectedOption) {
    String correctAnswer = _questions[_currentIndex].correctAnswer;
    bool isCorrect = selectedOption == correctAnswer;

    for (int i = 0; i < _questions[_currentIndex].options.length; i++) {
      if (_questions[_currentIndex].options[i] == correctAnswer) {
        // Mark the correct answer as green
        setState(() {
          _buttonColors[i] = Colors.green;
        });
      } else if (_questions[_currentIndex].options[i] == selectedOption) {
        // Mark the selected incorrect answer as red
        setState(() {
          _buttonColors[i] = Colors.red;
        });
      }
    }

    if (isCorrect) {
      _score += 10; // Add points only for correct answers
    }

    _timer?.cancel(); // Stop the timer

    // Wait for 2 seconds to display the next question
    Future.delayed(Duration(seconds: 1), () {
      _showNextQuestion();
    });
  }

  void _showNextQuestion() {
    setState(() {
      // Move to the next question or show the score
      if (_currentIndex < 9) {
        // Show only 10 questions (0 to 9)
        _currentIndex++;
        _buttonColors = List.filled(
          4,
          Color.fromRGBO(63, 76, 120, .7),
        ); // Reset button colors for the next question
        _startTimer(); // Reset the timer for the next question
      } else {
        _showScore();
      }
    });
  }

  void popToHomeScreen(BuildContext context) {
    Navigator.of(context).popUntil((route) {
      // Replace 'HomeScreen' with the name of your HomeScreen class
      return route.settings.name == HomePage;
    });
  }

  void _showScore() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
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
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .13),
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.blue
                                    .withOpacity(0.3), // Shadow color
                                spreadRadius:
                                1, // Spread radius (how far the shadow spreads)
                                blurRadius:
                                15, // Blur radius (how blurry the shadow is)
                                offset: Offset(0, 3),
                              )
                            ]),
                            margin: EdgeInsets.all(20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.blue
                                    .withOpacity(0.3), // Shadow color
                                spreadRadius:
                                1, // Spread radius (how far the shadow spreads)
                                blurRadius:
                                15, // Blur radius (how blurry the shadow is)
                                offset: Offset(0, 3),
                              )
                            ]),
                            margin: EdgeInsets.all(10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .3,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FlutterQuiz()));
                                  },
                                  child: Text(
                                    "Restart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]))));
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _loadQuizData();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    QuizQuestion currentQuestion = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(63, 76, 120, 1),
        title: Text('Flutter Quiz'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_showTimer)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: _timer != null ? (_timer!.tick / 30) : 1.0,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        minHeight: 10,
                      ),
                    ),
                  SizedBox(height: 16.0),
                  Text(
                    'Question ${_currentIndex + 1}:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    currentQuestion.question,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Column(
                      children: List.generate(
                        currentQuestion.options.length,
                            (index) {
                          String option = currentQuestion.options[index];
                          return SizedBox(
                              width: MediaQuery.of(context).size.width * .8,
                              child: ElevatedButton(
                                onPressed: () => _checkAnswer(option),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50)),
                                    primary: _buttonColors[index]),
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -10,
                      child: Image(
                        image: AssetImage("assets/bg1.png"),
                        width: MediaQuery.of(context).size.width * 2,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

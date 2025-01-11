import 'package:adv_quiz/questions_screen.dart';
import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'models/start_screen.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // store answer we getting length error
  List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {
        selectedAnswer = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer:chooseAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
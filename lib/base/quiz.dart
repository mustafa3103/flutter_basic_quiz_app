import 'package:basic_quiz_app/data/questions.dart';
import 'package:basic_quiz_app/questionsScreen/questions.screen.dart';
import 'package:basic_quiz_app/welcomeScreen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:basic_quiz_app/resultScreen/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
          choosenAnswers: selectedAnswers, onRestart: restartQuiz);
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Color.fromRGBO(97, 163, 230, 1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: screenWidget,
      ),
    ));
  }
}

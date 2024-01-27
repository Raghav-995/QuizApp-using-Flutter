import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/questions/questions.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswer = [];
  var _activescreen = 'start-screen';
  void _switchscreen() {
    setState(() {
      _activescreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);

    if (_selectedAnswer.length == questions.length) {
      setState(() {
        _activescreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _activescreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = Startscreen(_switchscreen);
    if (_activescreen == 'question-screen') {
      screen = Questionscreen(
        onselectedAnswer: chooseAnswer,
      );
    }
    if (_activescreen == 'result-screen') {
      screen = ResultScreen(
        choosenAnswers: _selectedAnswer,
        restartQuiz: restartQuiz,
      );
      _selectedAnswer = [];
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "QuizApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(149, 36, 201, 36),
              Color.fromARGB(153, 167, 184, 14),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screen,
        //child: _activescreen == 'start-screen'
        // ? Startscreen(_switchscreen)
        //: const Questionscreen(),
      ),
    ));
  }
}

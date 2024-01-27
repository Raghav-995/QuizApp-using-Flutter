import 'package:flutter/material.dart';
import 'package:quizapp/questions/questions.dart';
import 'package:quizapp/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key, required this.onselectedAnswer});
  final void Function(String answer) onselectedAnswer;
  @override
  State<Questionscreen> createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {
  var currentIndex = 0;
  void nextQuestion(String selectedAnswer) {
    widget.onselectedAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 245, 12, 12),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion.shuffleAnswers().map((answer) {
                return AnswerButton(
                    answer: answer,
                    onpress: () {
                      nextQuestion(answer);
                    });
              }),
            ]),
      ),
    );
  }
}

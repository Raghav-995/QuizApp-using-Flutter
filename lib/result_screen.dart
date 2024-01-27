import 'package:flutter/material.dart';
import 'package:quizapp/questions/questions.dart';
import 'package:quizapp/question_summary/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.restartQuiz,
  });
  final List<String> choosenAnswers;
  final void Function() restartQuiz;
  List<Map<String, Object>> getsummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final numtotalquestions = questions.length;
    final summaryData = getsummaryData();
    final numcorrectanswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Congratulations, You have answered correctly $numcorrectanswer out of $numtotalquestions answers !!!",
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 248, 14, 178),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text(
                "Restart Quiz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/question_summary/question_number.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summarydata, {super.key});
  final Map<String, Object> summarydata;
  @override
  Widget build(context) {
    final isCorrectAnswer =
        summarydata['user_answer'] == summarydata['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionNumber(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: summarydata['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summarydata['questions'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text("Your Answer is:" + "   " + (summarydata['user_answer'] as String),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 228, 35, 21),
                    )),
                const SizedBox(height: 5),
                Text("Correct Answer is:"+ "   " + (summarydata['correct_answer'] as String),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 5, 66, 26),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

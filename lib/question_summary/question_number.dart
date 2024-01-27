import 'package:flutter/material.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });
  final bool isCorrectAnswer;
  final int questionIndex;
  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 14, 131, 233)
            : const Color.fromARGB(255, 241, 20, 227),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}

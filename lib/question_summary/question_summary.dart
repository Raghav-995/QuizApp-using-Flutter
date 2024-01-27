import 'package:flutter/material.dart';
import 'package:quizapp/question_summary/summary_data.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(
    this.summaryData, {
    super.key,
  });
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryData(data);
          }).toList(),
        ),
      ),
    );
  }
}

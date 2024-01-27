class QuestionModel {
  const QuestionModel(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> shuffleAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}

class Question {
  String question;
  bool answer;

  Question(this.question, this.answer);
}

List<String> questions = [];
List<bool> answers = [false, true, false];

List<Question> questionBank = [
  Question('French is an official language in Canada.', false),
  Question('Tetris is the #1 best-selling video game of all-time.', false),
  Question('The color orange is named after the fruit.', false),
];

import 'Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('French is an official language in Canada.', false),
    Question('Tetris is the #1 best-selling video game of all-time.', false),
    Question('The color orange is named after the fruit.', false),
    Question('The flag of South Africa features 7 colours.', false),
    Question('Shrimp can swim backwards.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isLastQuestion() {
    return _questionNumber == _questionBank.length - 1;
  }

  String getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswers() {
    return _questionBank[_questionNumber].answer;
  }

  void restartGame() {
    _questionNumber = 0;
  }

  int totalQuestions() {
    return _questionBank.length;
  }
}

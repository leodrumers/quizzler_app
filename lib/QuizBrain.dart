import 'Question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> questionBank;

  QuizBrain({this.questionBank});

  void nextQuestion() {
    if (_questionNumber < questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isLastQuestion() {
    return _questionNumber == questionBank.length - 1;
  }

  String getQuestion() {
    return questionBank[_questionNumber].question;
  }

  bool getAnswers() {
    return questionBank[_questionNumber].answer;
  }

  void restartGame() {
    _questionNumber = 0;
  }

  int totalQuestions() {
    return questionBank.length;
  }

  factory QuizBrain.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<Question> questionList =
        list.map((i) => Question.fromJson(i)).toList();
    // print('Question list: ${questionList.first.question}');
    return QuizBrain(
      questionBank: questionList,
    );
  }
}

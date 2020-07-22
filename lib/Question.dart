import 'dart:convert';

const HtmlEscape htmlEscape = HtmlEscape();

class Question {
  String question;
  bool answer;

  Question({this.question, this.answer});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    bool answer =
        parsedJson['correct_answer'] as String == 'True' ? true : false;

    String htmlText = parsedJson['question'] as String;
    String question = htmlText
        .replaceAll('%20', ' ')
        .replaceAll('%27', '\'')
        .replaceAll('%2C', ',')
        .replaceAll('%22', '"');
    print('question:\t$question, \n\t$htmlText\n\t$answer');
    return Question(question: question, answer: answer);
  }
}

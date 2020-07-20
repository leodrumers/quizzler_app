import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'QuizBrain.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizzerPage(),
        )),
      ),
    ),
  );
}

class QuizzerPage extends StatefulWidget {
  @override
  _QuizzerPageState createState() => _QuizzerPageState();
}

class _QuizzerPageState extends State<QuizzerPage> {
  List<Icon> scoreKeeper = [];
  int correctAnswers = 0;
  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 8.0),
          child: Wrap(
            children: scoreKeeper,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(true, context);
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(false, context);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  void checkAnswer(bool answerSelected, BuildContext context) {
    var questionAnswer = quizBrain.getAnswers();
    if (questionAnswer == answerSelected) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      correctAnswers++;
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    if (quizBrain.isLastQuestion()) {
      _quizFinishedDialog(context);
      quizBrain.restartGame();
      scoreKeeper.clear();
      correctAnswers = 0;
    } else {
      quizBrain.nextQuestion();
    }
  }

  _quizFinishedDialog(context) {
    Alert(
        context: context,
        title: 'You\'ve finished the quiz',
        desc: 'You answered $correctAnswers/${quizBrain.totalQuestions()}',
        style: AlertStyle(
            backgroundColor: Colors.grey.shade900,
            titleStyle: TextStyle(color: Colors.white),
            descStyle: TextStyle(color: Colors.white),
            isCloseButton: false),
        buttons: [
          DialogButton(
            child: Text('Ok'),
            color: Colors.green,
            onPressed: () => Navigator.pop(context),
          ),
        ]).show();
  }
}

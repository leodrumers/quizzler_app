import 'package:flutter/material.dart';

import 'Question.dart';

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
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 8.0),
          child: Row(
            children: scoreKeeper,
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                questionBank[questionIndex].question,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                'True',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  if (questionBank[questionIndex].answer == true) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  if (questionBank[questionIndex].question ==
                      questionBank.last) {
                    questionIndex = 0;
                  } else {
                    questionIndex++;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                'False',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  if (questionBank[questionIndex].answer == false) {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  } else {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  if (questionBank[questionIndex].question ==
                      questionBank.last) {
                    questionIndex = 0;
                  } else {
                    questionIndex++;
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

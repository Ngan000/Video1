import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What \'s your favorite color?',
      'answer': [
        {'text': 'Back', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Bkack', 'score': 1},
      ]
    },
    {
      'questionText': 'What \'s your favorite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ]
    },
    {
      'questionText': 'Who \'s your favorite instruction?',
      'answer': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //var aBool = true;
    //aBool = false;

    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more question');
    } else {
      print('No more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    //questions = []; //does not work if questions is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result.c(_totalScore, _resetQuiz),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(
      {super.key, required this.selectHandler, required this.answerText});
  final VoidCallback selectHandler;
  final String answerText;

  Answer.b(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

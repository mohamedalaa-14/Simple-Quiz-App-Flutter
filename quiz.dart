import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz  extends StatelessWidget {
  final question;
  final questionIndex;
  final answerQuestion;
  Quiz(this.question,this.questionIndex,this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question[questionIndex]['questionText']),
        ...(question[questionIndex]['answer'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(()=> answerQuestion(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
import 'package:flutter/material.dart';

import 'package:grammar_quiz/models/answer.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.answer,
      required this.isAnswered,
      required this.isChosen,
      required this.onTap});
  final Answer answer;
  final bool isAnswered;
  final Function() onTap;
  final bool isChosen;
  @override
  Widget build(BuildContext context) {
    Color checkColor = isAnswered && answer.isCorrect
        ? const Color.fromARGB(255, 98, 255, 0)
        : isChosen && !answer.isCorrect
            ? const Color.fromARGB(255, 194, 13, 0)
            : Colors.white;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            border: Border.all(color: checkColor),
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30)),
        child: TextButton(
          onPressed: onTap,
          child: Text(
            answer.answerText,
            style: TextStyle(color: checkColor),
          ),
        ),
      ),
    );
  }
}

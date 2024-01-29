import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grammar_quiz/data/question_list.dart';

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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            border: isAnswered && answer.isCorrect
                ? Border.all(color: Color.fromARGB(255, 98, 255, 0))
                : isChosen && !answer.isCorrect
                    ? Border.all(color: Color.fromARGB(255, 194, 13, 0))
                    : Border.all(color: Colors.white),
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30)),
        child: TextButton(
          onPressed: onTap,
          child: Text(answer.answerText,
              style: isAnswered && answer.isCorrect
                  ? const TextStyle(color: Color.fromARGB(255, 0, 255, 8))
                  : isChosen && !answer.isCorrect
                      ? const TextStyle(color: Color.fromARGB(255, 255, 0, 0))
                      : const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

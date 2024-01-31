import 'package:grammar_quiz/models/answer.dart';

class Question {
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText, this.answerList);
}
import 'package:flutter/material.dart';
import 'package:grammar_quiz/data/question_list.dart';
import 'package:grammar_quiz/models/answer.dart';
import 'package:grammar_quiz/models/question.dart';
import 'package:grammar_quiz/quiz_page.dart';
import 'package:grammar_quiz/result_page.dart';
import 'package:grammar_quiz/start_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var activePage = 'start_page';
  List<Answer> chosenAnswers = [];
  List<Question> questionList = getQuestions();
  onChooseAnswer(Answer answer) {
    chosenAnswers.add(answer);
    if (chosenAnswers.length == getQuestions().length) {
      setState(() {
        switchPage('result_page');
      });
    }
  }

  void onRestart(String page) {
    setState(() {
      chosenAnswers = [];
      activePage = page;
    });
  }

  void switchPage(String page) {
    setState(() {
      activePage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    Widget currentPage = StartPage(onStart: switchPage);
    switch (activePage) {
      case 'start_page':
        currentPage = StartPage(onStart: switchPage);
        break;
      case 'quiz_page':
        currentPage = QuizPage(
          switchPage,
          addAnswer: onChooseAnswer,
        );
        break;
      case 'result_page':
        currentPage = ResultPage(
          onRestart: onRestart,
          chosenAnswers: chosenAnswers,
          questionList: questionList,
        );
        break;
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 117, 41, 209),
          Color.fromRGBO(170, 21, 58, 1)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: currentPage,
      ),
    );
  }
}

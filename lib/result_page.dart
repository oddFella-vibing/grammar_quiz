import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grammar_quiz/data/question_list.dart';
import 'package:grammar_quiz/utils/summary_item.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.chosenAnswers,
      required this.onRestart,
      required this.questionList});
  final List<Answer> chosenAnswers;
  final List<Question> questionList;
  final Function(String) onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryList = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryList.add({
        'quiz_id': i + 1,
        'question': questionList[i].questionText,
        'right_answer': getCorrectAnswers()[i],
        'user_answer': chosenAnswers[i].answerText
      });
    }
    return summaryList;
  }
  

  @override
  Widget build(BuildContext context) {
    var totalQuestion = questionList.length;
    var totalCorrect= getSummaryData().where((element) => element['right_answer']==element['user_answer'],).length;
    
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 100,left: 10),
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('quiz completed !',style: GoogleFonts.kalam(color: Colors.white),),
                    Text(
                                  'You answered $totalCorrect out of $totalQuestion questions correctly.',
                                  style: GoogleFonts.fjallaOne(color: Colors.white, fontSize: 25,letterSpacing: 3),
                                ),
                  ],
                )),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: const Color.fromARGB(255, 222, 222, 222))),
                  gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.8), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(20))),
              child: Stack(children: [
                ListView(
                  children: [
                    ...getSummaryData()
                        .map((data) => SummaryItem(summaryData: data))
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.deepPurple.shade200,
                          Colors.deepPurple.shade400
                        ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepPurple.shade700,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(2, 2)),
                          BoxShadow(
                              color: Colors.deepPurple.shade200,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(-2, -2))
                        ]),
                    child: IconButton(
                        onPressed: () => onRestart('quiz_page'),
                        icon: const Icon(Icons.refresh,color: Color.fromARGB(255, 255, 255, 255),)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.deepPurple.shade200,
                          Colors.deepPurple.shade400
                        ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepPurple.shade700,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset:const Offset(3, 3)),
                          BoxShadow(
                              color: Colors.deepPurple.shade200,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset:const Offset(-3, -3))
                        ]),
                    child: IconButton(
                        onPressed: () => onRestart('start_page'),
                        icon: const Icon(Icons.exit_to_app,color: Colors.white,)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

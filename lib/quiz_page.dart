import 'package:flutter/material.dart';
import 'package:grammar_quiz/data/question_list.dart';
import 'package:grammar_quiz/utils/answer_button.dart';

class QuizPage extends StatefulWidget {
  const QuizPage(this.switchPage, {super.key, required this.addAnswer});
  final Function(String) switchPage;
  final Function(Answer) addAnswer;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var currentQuizIndex = 0;
  Answer chosenAnswer = Answer('', false);
  var isAnswered = false;
  final questionList = getQuestions();

  void onNext() {
    setState(() {
      widget.addAnswer(chosenAnswer);
      chosenAnswer = Answer('', false);
      isAnswered = false;
      currentQuizIndex++;
    });
  }

  void onAnswer(Answer answer) {
    setState(() {
      isAnswered = true;
      chosenAnswer = answer;
    });
  }
 

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionList[currentQuizIndex];
  
    var checkChosenAnswer = chosenAnswer;
    var answered = currentQuizIndex + 1;
    var total = questionList.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
      child: Column(
        children: [
          Stack(
            children: [
              Transform(
                alignment: Alignment.center, //origin: Offset(100, 100)
                transform: Matrix4.rotationZ(0.05),
                child: Container(
                  height: 580,
                  decoration: BoxDecoration(
                      color:
                        const  Color.fromARGB(255, 244, 240, 255).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Container(
                height: 580,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 202, 114, 114),
                      Color.fromARGB(255, 159, 83, 189)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: chosenAnswer.isCorrect
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            '$answered / $total',
                            style:const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Container(
                            height: 150,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.white, width: 1))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 20),
                              child: Text(
                                currentQuestion.questionText,
                                style:const TextStyle(
                                    fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ...currentQuestion.answerList.map((answer) =>
                          AnswerButton(
                              isChosen: checkChosenAnswer == answer,
                              answer: answer,
                              isAnswered: isAnswered,
                              onTap: () => onAnswer(answer)))
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
            child: Visibility(
              visible: isAnswered,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withAlpha(100),
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white)),
                onPressed: onNext,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('next'),
                    Icon(Icons.arrow_forward),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


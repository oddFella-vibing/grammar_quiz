class Question {
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<String> getCorrectAnswers() {
  List<String> list = [];
  getQuestions().forEach((data) => data.answerList.forEach((answer) => {
        if (answer.isCorrect) {list.add(answer.answerText)}
      }));
  return list;
}

List<Question> getQuestions() {
  List<Question> list = [];
  list.add(Question(
    'Do not  you dare ________ that vase!',
    [
      Answer('touch', true),
      Answer('to touch', false),
      Answer('touched', false),
      Answer('touching', false),
    ],
  ));
  list.add(Question(
    'My brother __________ actively involved  in voluntary work for over two years.',
    [
      Answer('has been being', false),
      Answer('has been worked', false),
      Answer('has been ', true),
      Answer('have been', false),
    ],
  ));
  list.add(Question(
    'The most distinctive characteristics of Min Htaw  is ______________.',
    [
      Answer('hospital', false),
      Answer('hospitalization', false),
      Answer('hospitalize', false),
      Answer('hospitality', true),
    ],
  ));
  list.add(Question(
    "If your goal is to become a good programmer, you _____ your best.",
    [
      Answer("should be tried", false),
      Answer("would try", false),
      Answer("should try", true),
      Answer("might try", false)
    ],
  ));
  list.add(Question(
    'The full moon day of Thadingyut is the gazette day so we ______ the program course.',
    [
      Answer("do not need to attend", true),
      Answer("must not attend", false),
      Answer("cannot attend", false),
      Answer("could not attend", false),
    ],
  ));
  list.add(Question(
    'It is hard ____ with others because you are not them.',
    [
      Answer("empathy", false),
      Answer("to empathize", true),
      Answer("empathizing", false),
      Answer("empathize", false),
    ],
  ));
  list.add(Question(
    'Find the Adjective Phrase. "The man sitting in front of us is our MSI principal."',
    [
      Answer("in front of us", false),
      Answer("out MSI principal", false),
      Answer("sitting in front of us", true),
      Answer("in front of us", false),
    ],
  ));
  list.add(Question(
    'Which one is the verb in the predicate of the sentence? HUAWEI phones made in China are very good.',
    [
      Answer("made", false),
      Answer("are", false),
      Answer("are very good", false),
      Answer("are good", true),
    ],
  ));
  list.add(Question(
    'Choose the correct answer. The boy said, "Aunt, go straight and turn left.',
    [
      Answer("The boy said that his aunt to go straight and turn left", false),
      Answer("The boy told his aunt to go straight and turn left", true),
      Answer("The boy told his aunt why she go straight and turn left", false),
      Answer("The boy told his aunt not to go straight and turn left", false),
    ],
  ));
  list.add(Question(
    'We enjoyed the trip to Pyin Oo Lwin. It was really _______.',
    [
     
      Answer("enjoy", false),
       Answer("enjoyable", true),
      Answer("enjoyment", false),
      Answer("enjoys", false),
    ],
  ));
  return list;
}

List<Answer> getAnswersRandom() {
  List<Answer> answerlist = [];

  return answerlist;
}

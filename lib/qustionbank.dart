

import 'package:quizy/question.dart';

class QuestionBank {
  int questionNumber = 0;

  List<Question> questionBank = [
    Question(q: 'Do camels have three sets of eyelids?', a: true),
    Question(q: 'It is possible to sneeze while sleeping.', a: false),
    Question(q: 'Australia is a country as well as a continent.', a: true),
    Question(q: 'Herbivore animals consume meat.', a: false),
    Question(q: 'The cell nucleus was discovered by Robert Brown.', a: true)
  ];
void nextQusetion(){
  if(questionNumber<questionBank.length-1){
    questionNumber++;
  }
}
String getQuestion(){
  return questionBank[questionNumber].QText;
}

bool getAnswer(){
  return questionBank[questionNumber].Qanswer;
}

bool isFinished (){
  if (questionNumber==questionBank.length-1) {
    return true;
  }
  else {
    return false;
  }
}

void reset(){
  questionNumber =0;
}

}
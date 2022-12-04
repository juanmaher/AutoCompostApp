//this class contains all necessary code for question and different state of questions

import 'question_model.dart';


class QuizBrain {
  int _questionNum = 0;
  final List<Question> _questionBank = [
    Question('¿Qué tipo de lombrices son más adecuadas para una compostera?', ["Lombrices de tierra epigeas", "Lombrices rojas californianas", "Lombrices de tierra endógeas"], 1),
    Question('¿Cuales son las 3 "R" de la ecología?', ["Reciclar, Reutilizar, Reducir", "Reutilizar, Recuperar, Reservar"], 0),
    Question('¿Cuanto dura el proceso de compost?', ["De 3 a 6 meses", "De 7 a 9 meses", "De 10 a 12 meses"], 0),
    Question('En el proceso de compostaje los materiales orgánicos se degradan de forma:', ["Química, por la reacción con el nitrógeno del aire", "Biológica, a través de microorganismos"], 1),
    Question('Si el material degradado presenta mal olor o aparecen mosquitas, debo:', ["Adicionar material estructurante y voltear la mezcla", "Regar", "Dejar de agregar material por un tiempo"], 0),
    Question('¿Qué materiales NO se pueden poner en una compostera domiciliaria?',
        ["Yerba y café", "Papeles y cartones","Lácteos y aceites"], 2),
    Question('El compostaje es un proceso:', ["Anaeróbico (que no requiere oxígeno)", "Aeróbico (que requiere oxígeno)"], 1),
    Question('Aproximadamente: ¿Que porcentaje de nuestra basura es organica en Argentina?', ["58%","49%", "33%"], 1),
    Question('¿Cuál es la proporción recomendada para diluir el liquido lixidiado?', ["1 en 2","1 en 5", "1 en 10"], 2)
  ];

  QuizBrain(){
    _questionBank.shuffle();
  }


  void reset() {
    _questionNum = 0;
    _questionBank.shuffle();
  }

  void nextQuestion() {
    if (isFinished() == true) {
    } else {
      if (_questionNum < _questionBank.length - 1) {
        _questionNum++;
      }
    }
  }

  bool isFinished() {
    if (_questionBank[_questionNum] == _questionBank.last) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNum].questionText;
  }
  String getAnswer(int nmbr) {
    return _questionBank[_questionNum].questionAnswers[nmbr];
  }

  int getCorrectAnswer() {
    return _questionBank[_questionNum].correct;
  }

  List<String> getAnswers() => _questionBank[_questionNum].questionAnswers;

  int getNumberOfQuestions() {
    return _questionBank.length;
  }

  int getActualNumberQuestion() => _questionNum;
}

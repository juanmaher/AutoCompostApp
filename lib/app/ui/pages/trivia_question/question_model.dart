//this class contains model for questions, it means each question will contain question and true or false value to it
class Question {
  String questionText = '';
  List<String> questionAnswers = [];
  int correct = 0;

  Question(this.questionText, this.questionAnswers, this.correct);
}

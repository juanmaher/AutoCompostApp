import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> scoreKeeper = [];
  int correctScore = 0;
  int totalQuestions = quizBrain.getNumberOfQuestions();
  int numberQuestion = 0;

  void checkAnswer(int userAnswer) {
    if (userAnswer == quizBrain.getCorrectAnswer()) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
      correctScore++;
    } else {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    if (quizBrain.isFinished() == true) {
      Alert(
          context: context,
          title: "Trivia completada!",
          content: Column(
            children: [
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
              Text('¡Acertaste a $correctScore respuestas correctas de $totalQuestions !',
              textAlign: TextAlign.center,)
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  scoreKeeper.clear();
                  quizBrain.reset();
                  correctScore = 0;
                });
              },
              child: const Text(
                "RETRY",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top: 50),
            child:Text(
              "Pregunta ${quizBrain.getActualNumberQuestion()+1}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
        ),
        //Expanded(child: ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(0),
                ),
              ),
              child: Container(
                height: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text(
                    quizBrain.getAnswer(0),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  checkAnswer(0);
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(0),
                ),
              ),
              child: Container(
                height: double.infinity,
                color: Colors.red,
                child: Center(
                  child: Text(
                    quizBrain.getAnswer(1),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  setState(() {
                    checkAnswer(1);
                    quizBrain.nextQuestion();
                  });
                });
              },
            ),
          ),
        ),
        //Row(children: scoreKeeper)
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child:Text("Correctas: $correctScore",
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        ),
        ],
        ),
    );
  }
}
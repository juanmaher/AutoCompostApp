import 'package:flutter/material.dart';
import 'questions.dart';
import 'counter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';
import 'package:flutter_meedu/ui.dart';

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
  int seconds = 60;

  Counter contador = Counter(15);
  //final stream = contador.stream.asBroadcastStream();
  //contador.initiate();

  //final suscripcion = stream.listen((segs) => print('Segundos: $segs') );
  //contador.initiate();

  void checkAnswer(int userAnswer) {
    contador.stop();
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
                  //scoreKeeper.clear();
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
  void nextQuestion(){
    checkAnswer(-1);
    if (quizBrain.isFinished() == false) {
      contador.restart();
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    contador.stream.asBroadcastStream().listen((segs)  {if(segs == 0) {
      setState(() {
        checkAnswer(-1);
      });
    }
    } );
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
                fontSize: 35.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 15),
        child:  StreamBuilder(
            stream: contador.stream.asBroadcastStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: (snapshot.data != null && snapshot.data <= 10 ? Colors.red : Colors.green),
                  shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(55),
                ),
                child: Text(
                  snapshot.data != null? snapshot.data.toString() : seconds.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                ),
              );
              },
          ),
        ),
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
        const Spacer(),
        Expanded(
          flex: 2,
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
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
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
                  });
                });
              },
            ),
          ),
        ),
        //Row(children: scoreKeeper)
        SizedBox(
          height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
                child: TextButton(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.orange,
                    child: const Text(
                  "Salir",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {setState((){
                  quizBrain.reset();
                  correctScore = 0;
                  contador.stop();
                  router.pop();});}
                ),
            ),
            Expanded(
              child: TextButton(
                //color: Colors.red,
                onPressed: () {setState(() {
                  nextQuestion();
                });},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.yellow,
                  child: const Text(
                  "Siguiente",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
        ),
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
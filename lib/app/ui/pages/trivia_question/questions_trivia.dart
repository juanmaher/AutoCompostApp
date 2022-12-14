import 'package:flutter/material.dart';
import 'questions.dart';
import 'counter.dart';
import 'optionBuilder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

QuizBrain quizBrain = QuizBrain();
const int seconds = 60;

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> scoreKeeper = [];
  List<Widget> optionWidgets = <Widget>[];
  int correctScore = 0;
  int totalQuestions = quizBrain.getNumberOfQuestions();
  int numberQuestion = 0;
  int userAnswer = -1;

  Counter contador = Counter(seconds);
  //final stream = contador.stream.asBroadcastStream();
  //contador.initiate();

  //final suscripcion = stream.listen((segs) => print('Segundos: $segs') );
  //contador.initiate();

  void checkAnswer(int nmbrAnswer) {
    if(userAnswer < 0) {
      SystemSound.play(SystemSoundType.alert);
      contador.stop();
      userAnswer = nmbrAnswer;
      if (nmbrAnswer == quizBrain.getCorrectAnswer()) {
        FlutterRingtonePlayer.play(fromAsset: "assets/sounds/correct.wav",
          ios: IosSounds.glass,
          volume: 0.25,);
        scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        correctScore++;
      } else {
        FlutterRingtonePlayer.play(fromAsset: "assets/sounds/error.wav",
          ios: IosSounds.glass,
          volume: 0.15,);
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
                Text(
                  '??Acertaste a $correctScore respuestas correctas de $totalQuestions !',
                  textAlign: TextAlign.center,)
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    //scoreKeeper.clear();
                    contador.restart();
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
  }
  void nextQuestion(){
    if(userAnswer >= 0) {
      if (quizBrain.isFinished() == false) {
        contador.restart();
        quizBrain.nextQuestion();
        userAnswer = -1;
      }
    }else{
      checkAnswer(100000);
    }
  }

  Color getColor(int position){
    if(userAnswer >= 0 && quizBrain.getCorrectAnswer() == position){
      return Colors.green;
    }else if(userAnswer >= 0 && userAnswer == position){
      return Colors.red;
    }
    return Colors.grey;
  }

  String getSkip(){
    if(userAnswer >= 0){
      return "Siguiente";
    }else{
      return "Saltear";
    }
  }

  @override
  Widget build(BuildContext context) {
    contador.stream.asBroadcastStream().listen((segs)  {if(segs == 0) {
      setState(() {
        checkAnswer(10000);
      });
    }
    } );
    optionWidgets = <Widget>[];
    for (int i = 0; i < quizBrain.getAnswers().length; i++){
      optionWidgets.add(getWidgetOption(
                          getColor(i),
                          quizBrain.getAnswer(i),
                          () {setState(() {checkAnswer(i); }); }  ));
    }
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
        /*Expanded(
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
                color: getColor(0),
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
                color: getColor(1),
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
        ),*/
        Expanded(
          flex: 6,
          child:Column(children: optionWidgets,),
        ),
        //Row(children: scoreKeeper)
        const Spacer(),
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
                  child: Text(
                    getSkip(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/ui.dart';


class TriviaPage extends StatefulWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trivia')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //padding: const EdgeInsets.all(20),
          children: <Widget>[
             Container(
               padding: EdgeInsets.all(15),
               decoration: BoxDecoration(
                 color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: const <Widget>[
                  Text(
                    "Trivia",
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Demostrá tu conocimiento sobre compostar con esta simple trivia!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    ),
                ],
              ),
            ),
            const Spacer(),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text("Tenes solo 60 segundos para responder cada pregunta.\n"
            "Cuando estes listo precioná en empezar para iniciar la trivia.\n"
            "Podes terminar la trivia cuando quieras.",
            textAlign: TextAlign.center,),
          ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                          )
                      )
                  ),
                  onPressed: () {router.pushNamed(Routes.TRIVIA_QUESTION);},
                  child: const Text(
                      "Empezar!",
                    style: TextStyle(fontSize: 20,)
                  ),

              ),
            ),
            const Spacer(),
          ],
        ),
        ),
      ),
    );
  }
}

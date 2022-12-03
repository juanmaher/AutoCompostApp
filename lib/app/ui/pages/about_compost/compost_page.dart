import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class CompostPage extends StatefulWidget {
  const CompostPage({Key? key}) : super(key: key);

  @override
  State<CompostPage> createState() => _CompostPageState();
}

class _CompostPageState extends State<CompostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('¿Qué es el compost?')),
      body: Center(
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          padding: const EdgeInsets.all(20),
          children: const <Widget>[
            Padding(padding:EdgeInsets.symmetric(vertical: 10),
              child: Text(
              "¿Qué es el compost?",
              style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "El compost es el producto del proceso natural de descomposición aeróbica de los residuos"
              " orgánicos, por el cuál estos se convierten en abono orgánico. A veces llamado composta,"
              " compuesto, o abono orgánico, es obtenido de manera natural por la descomposición aeróbica "
              "de residuos orgánicos vegetales por medio de la reproducción masiva de bacterias aeróbicas "
              "que están presentes en forma natural en cualquier lugar.",
              style: TextStyle(fontSize: 15, color: Color(0xFF50504F),),
            ),
          ],
        ),
      ),
    );
  }
}

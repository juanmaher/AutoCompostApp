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
          children: <Widget>[
            Padding(padding:EdgeInsets.symmetric(vertical: 10),
              child: Text(
              "¿Qué es el compost?",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
               ),
              ),
            ),
            Padding(padding:EdgeInsets.symmetric(vertical: 10),
              child: Text(
              "El compost es el producto del proceso natural de descomposición aeróbica de los residuos"
              " orgánicos, por el cuál estos se convierten en abono orgánico. A veces llamado composta,"
              " compuesto, o abono orgánico, es obtenido de manera natural por la descomposición aeróbica "
              "de residuos orgánicos vegetales por medio de la reproducción masiva de bacterias aeróbicas "
              "que están presentes en forma natural en cualquier lugar.",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF50504F),
                fontFamily: 'OpenSans',
              ),
             ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:  Image.asset('assets/images/steps/step_03.jpg',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),

            Padding(padding:EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ciclo de vida del compost",
                style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding:EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "A través del compostaje nuestros residuos orgánicos pueden cerrar"
                    "su ciclo de vida. Al convertir los residuos en compost sus nutrientes"
                    "pueden volver a la tierra y asi convertirse en abono rico en nutrientes y volver"
                    "a dar vida a los suelos.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF50504F),
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/Compost_ilustration_3.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),

            Padding(padding:EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "¿Por qué compostar?",
                style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "El compostaje adecuado de los desechos orgánicos que generamos en nuestra vida diaria "
                  "(alimentos no comestibles o no utilizados) puede reducir la dependencia de fertilizantes "
                  "químicos, ayudar a recuperar la fertilidad del suelo y mejorar la retención de agua y "
                  "la llegada de nutrientes a las plantas que están presentes en forma natural en cualquier lugar. "
                  "Actualmente el 50% de los residuos generados en los hogares corresponde a residuos orgánicos"
                  "compostables. Al reciclar los residuos se contribuye a la reducción de los desechos destinados a "
                  "rellenos sanitarios, mitigando así el cambio climático.",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF50504F),
                fontFamily: 'OpenSans',
              ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/Compost_ilustration_4.jpg',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

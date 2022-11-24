import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyAutoCompostPage extends StatelessWidget {
  const MyAutoCompostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtengo el alto y el ancho de la pantalla
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoCompost'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.pushNamedAndRemoveUntil(Routes.HOME);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            // Solo tomo el 20% del alto de la pantalla
            height: size.height * 0.2,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height*0.2 - 27,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: Colors.green.withOpacity(0.23),
                        )
                      ],
                    ),
                    child: LinearPercentIndicator(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: 0.8,
                      //center: const Text("80.0%"),
                      barRadius: const Radius.circular(36),
                      progressColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

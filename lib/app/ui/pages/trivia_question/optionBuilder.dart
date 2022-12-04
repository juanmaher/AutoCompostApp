import 'package:flutter/material.dart';


Widget getWidgetOption(Color color, String texto, void Function() onPressFunc ){
  return Expanded(
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
          color: color,
          child: Center(
            child: Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        onPressed: () {
          onPressFunc();
        },
      ),
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static void show(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      // Con WillPopScope limitas a solo este scope para salir
      builder: (_) => WillPopScope(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
        onWillPop: ()async => false,
      ),
    );
  }
}
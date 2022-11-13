import 'package:autocompost/app/ui/routes/pages.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class AutoCompostApp extends StatelessWidget {
  const AutoCompostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoCompost App',
      navigatorKey: router.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      navigatorObservers: [
        //Esto detecta cuando el stack de paginas cambia
        router.observer,
      ],
      routes: appRoutes(),
    );
  }
}

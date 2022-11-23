import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi compostera App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi compostera App'),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/images/logo_fiuba.png', scale: 0.5,),
                )
            ),
          ],
          backgroundColor: Colors.green,
        ),
        body: Center(
        child: Column(
            children: [
              Image.asset('assets/images/lhead.png', width: 300,),
              const Padding (
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text("Mi compostera app",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'titl_login',
                      color: Colors.lightGreen),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("Ingresar:",
                  style: TextStyle(fontSize: 30, ),
                  ),
                ),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   minimumSize: const Size(300, 40),
                   textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => router.pushNamed(
                      Routes.REGISTER,

                  ),
                  child: const Text("Log in")
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 40),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => router.pushNamed(
                    Routes.REGISTER,

                  ),
                  child: const Text("Sign up")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

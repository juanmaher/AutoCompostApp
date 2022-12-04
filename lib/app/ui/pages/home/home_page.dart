import 'package:autocompost/app/data/data_sources/remote/user_data.dart';
import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/home/home_controller.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

late UserData userData;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    _getUserData();
  }

  void _getUserData() async {
    final String userUid = sessionProvider.read.user!.uid;
    FirebaseDatabase.instance.ref().child('/users/$userUid').onValue.listen((event) {
      final userMap = event.snapshot.value as Map;
      final compostersIds = _getCompostersIds();
      userData = UserData(
        compostersIds,
        name: userMap['name'],
        lastname: userMap['lastname'],
      );
    });
  }

  List<String> _getCompostersIds() {
    final String userUid = sessionProvider.read.user!.uid;
    List<String> composterIds = [];
    FirebaseDatabase.instance.ref().child('/users/$userUid/composters_ids').onValue.listen((event) {
      if (event.snapshot.value != null) {
        final value = event.snapshot.value as Map;
        for (var e in value.entries) {
          composterIds.add(e.value);
        }
      }
    });
    return composterIds;
  }

  Future<String> _getUserName() async {
    final String userUid = sessionProvider.read.user!.uid;
    final String userName;
    final snapshot = await FirebaseDatabase.instance.ref().child(
        '/users/$userUid/name').get();
    final data = (snapshot.value ?? '') as String;
    return data;
  }

  @override
  Widget build(BuildContext context) {

    Future<String> userName = _getUserName();

    // Obtengo el alto y el ancho de la pantalla
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: const Text('AutoCompost')),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: userName,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [

                        // Header
                        SizedBox(
                          // Solo tomo el 20% del alto de la pantalla
                          height: size.height * 0.12,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 20,
                                  bottom: 0,
                                ),
                                height: size.height * 0.2 - 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '¡Hola ${snapshot.data}!',
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .headline5
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // ¿Como compostar?
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            height: size.height*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green.shade200,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/images/Compost_ilustration_2.png',
                                        width: size.width*0.35,
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 28,
                                        vertical: 45,
                                      ),
                                      child: Text(
                                        '¿Cómo\nCompostar?',
                                        style: Theme.of(context).textTheme.headline6?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap:() {
                            router.pushNamed(Routes.COMPOST_MANUAL);
                          },
                        ),

                        // Mi compostera
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            height: size.height*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green.shade500,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 45,
                                      ),
                                      child: Text(
                                        'Mi\nCompostera',
                                        style: Theme.of(context).textTheme.headline6?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assets/images/composting.png',
                                        width: size.width*0.35,
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap:() {
                            if (userData.composterIds.isEmpty) {
                              router.pushNamed(Routes.MY_AUTOCOMPOST_LOGIN);
                            } else {
                              router.pushNamed(Routes.MY_COMPOSTER);
                            }
                          },
                        ),

                        // Composteras comunitarias
                        GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            height: size.height*0.2,
                            width: size.width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green.shade800,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 5,
                                      ),
                                      child: Image.asset('assets/images/Compostera_comunitaria.png',
                                        width: size.width*0.45,
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 45,
                                      ),
                                      child: Text(
                                        'Composteras\nComunitarias',
                                        style: Theme.of(context).textTheme.headline6?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                          onTap:() {
                            router.pushNamed(Routes.COMMUNITY_COMPOST);
                          },
                        ),

                        // Trivia
                        /*GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green.shade500,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                //top: 10
                              ),
                              child: Text(
                                'Trivia               ',
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Image.asset('assets/images/Compostera_comunitaria.png',
                            width: 188,
                            height: 400,
                            alignment: Alignment.center,
                            //opacity: const AlwaysStoppedAnimation(.6),
                          ),
                        ],
                      ),
                    ),
                    onTap:() {
                      router.pushNamed(Routes.TRIVIA_MAIN);
                    },
                  ),
                  const SizedBox(height: 20),*/

                        // Botón cerrar sesión
                        CupertinoButton(
                          color: Colors.green,
                          child: const Text(
                            'Cerrar sesión',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            await Get.find<AuthenticationRepository>().signOut();
                            router.pushNamedAndRemoveUntil(Routes.LOGIN);
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ];
            } else {
              children = <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 100,
                  ),
                  child: CircularProgressIndicator(),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}

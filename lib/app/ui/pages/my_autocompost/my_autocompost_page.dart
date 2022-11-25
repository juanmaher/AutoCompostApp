import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyAutoCompostPage extends StatefulWidget {
  const MyAutoCompostPage({Key? key}) : super(key: key);

  @override
  State<MyAutoCompostPage> createState() => _MyAutoCompostPageState();
}

class _MyAutoCompostPageState extends State<MyAutoCompostPage> {

  @override
  Widget build(BuildContext context) {
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
      body: const MyAutoCompostPageBody(),
    );
  }
}

class MyAutoCompostPageBody extends StatefulWidget {
  const MyAutoCompostPageBody({Key? key}) : super(key: key);

  @override
  State<MyAutoCompostPageBody> createState() => _MyAutoCompostPageBodyState();
}

class _MyAutoCompostPageBodyState extends State<MyAutoCompostPageBody> {

  final _database = FirebaseDatabase.instance.ref();

  bool isLoading = false;

  late int _complete = 0;
  late int _temperature = 0;
  late int _humidity = 0;
  late bool _mezcladora = false;
  late bool _trituradora = false;

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners(){
    _database.child('/composters/1/complete').onValue.listen((event) {
      final int data1 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _complete = data1;
      });
    });
    _database.child('/composters/1/temperature').onValue.listen((event) {
      final int data2 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _temperature = data2;
      });
    });
    _database.child('/composters/1/humidity').onValue.listen((event) {
      final int data3 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _humidity = data3;
      });
    });
    _database.child('/composters/1/mezcladora').onValue.listen((event) {
      final bool data4 = (event.snapshot.value ?? false) as bool;
      setState(() {
        _mezcladora = data4;
      });
    });
    _database.child('/composters/1/trituradora').onValue.listen((event) {
      final bool data5 = (event.snapshot.value ?? false) as bool;
      setState(() {
        _trituradora = data5;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final _databaseComposterRef = _database.child('/composters/1');

    // Obtengo el alto y el ancho de la pantalla
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            // Solo tomo el 20% del alto de la pantalla
            height: size.height * 0.2,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 20,
                    bottom: 20,
                  ),
                  height: size.height * 0.2 - 27,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      )
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Mi Compostera',
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 60,
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
                      percent: _complete.toDouble() / 100,
                      center: Text('$_complete%'),
                      barRadius: const Radius.circular(36),
                      progressColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      height: size.height * 0.2 - 27,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Temperatura: $_temperature',
                            style: Theme.of(context).textTheme.headline6?.copyWith(
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
              SizedBox(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      height: size.height * 0.2 - 27,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Humedad: $_humidity',
                            style: Theme.of(context).textTheme.headline6?.copyWith(
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (_trituradora != true) {
                        return Colors.grey;
                      }
                      return Colors.green;
                    },
                  ),
                ),
                onPressed: () {
                  if(_trituradora != true) {
                    _databaseComposterRef.update({'trituradora': true});
                  } else {
                    _databaseComposterRef.update({'trituradora': false});
                  }
                },
                child: Text(
                  'Trituradora',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (_mezcladora != true) {
                        return Colors.grey;
                      }
                      return Colors.green;
                    },
                  ),
                ),
                onPressed: () {
                  if(_mezcladora != true) {
                    _databaseComposterRef.update({'mezcladora': true});
                  } else {
                    _databaseComposterRef.update({'mezcladora': false});
                  }
                },
                child: Text(
                  'Mezcladora',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}


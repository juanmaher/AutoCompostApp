import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../main.dart';

class MyAutoCompostPage extends StatefulWidget {
  const MyAutoCompostPage(this.composterId, {Key? key, }) : super(key: key);

  final String composterId;

  @override
  State<MyAutoCompostPage> createState() => _MyAutoCompostPageState(composterId);
}

class _MyAutoCompostPageState extends State<MyAutoCompostPage> {
  _MyAutoCompostPageState(this.composterId);

  final String composterId;

  final _database = FirebaseDatabase.instance.ref();

  bool isLoading = false;

  late int _complete = 0;
  late int _temperature = 0;
  late int _humidity = 0;
  late bool _mezcladora = false;
  late bool _trituradora = false;
  late int _dayOfProcess = 0;
  late bool _fan = false;

  //Holds the data source of chart
  List<_ChartData> chartData = <_ChartData>[];
  final TooltipBehavior _tooltipBehaviorTemperature = TooltipBehavior(enable: true);
  final TooltipBehavior _tooltipBehaviorHumidity = TooltipBehavior(enable: true);
  final ZoomPanBehavior _zoomPanBehaviorTemperature = ZoomPanBehavior(
    // Enables pinch zooming
    enablePinching: true,
    zoomMode: ZoomMode.xy,
    enablePanning: true,
  );
  final ZoomPanBehavior _zoomPanBehaviorHumidity = ZoomPanBehavior(
    // Enables pinch zooming
    enablePinching: true,
    zoomMode: ZoomMode.xy,
    enablePanning: true,
  );

  @override
  void initState() {
    super.initState();
    _activateListeners();
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() { });
      });
    });
  }

  void _activateListeners(){
    _database.child('/composters/$composterId/complete').onValue.listen((event) {
      final int data1 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _complete = data1;
      });
    });
    _database.child('/composters/$composterId/temperature').onValue.listen((event) {
      final int data2 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _temperature = data2;
      });
    });
    _database.child('/composters/$composterId/humidity').onValue.listen((event) {
      final int data3 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _humidity = data3;
      });
    });
    _database.child('/composters/$composterId/mezcladora').onValue.listen((event) {
      final bool data4 = (event.snapshot.value ?? false) as bool;
      setState(() {
        _mezcladora = data4;
      });
    });
    _database.child('/composters/$composterId/trituradora').onValue.listen((event) {
      final bool data5 = (event.snapshot.value ?? false) as bool;
      setState(() {
        _trituradora = data5;
      });
    });
    _database.child('/composters/$composterId/days').onValue.listen((event) {
      final int data1 = (event.snapshot.value ?? 0) as int;
      setState(() {
        _dayOfProcess = data1;
      });
    });
    _database.child('/composters/$composterId/fan').onValue.listen((event) {
      final bool data1 = (event.snapshot.value ?? false) as bool;
      setState(() {
        _fan = data1;
      });
    });
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue =
    await FirebaseFirestore.instance.collection("chartData").get();
    List<_ChartData> list = snapShotsValue.docs
        .map((e) => _ChartData(x: DateTime.fromMillisecondsSinceEpoch(
        e.data()['x'].millisecondsSinceEpoch), y: e.data()['y'])).toList();
    setState(() {
      chartData = list;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final databaseComposterRef = _database.child('/composters/$composterId');

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
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Compostera $composterId',
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
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                        bottom: 5,
                        top: 5,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              'Volumen completado',
                              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          LinearPercentIndicator(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 2500,
                            percent: _complete.toDouble() / 100,
                            center: Text(
                              '$_complete%',
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            barRadius: const Radius.circular(36),
                            progressColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              // Temperatura
              SizedBox(
                height: 100,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 0,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Temperatura',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Actual: $_temperature ºC',
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Humedad
              SizedBox(
                height: 100,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 0,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Humedad',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Actual: $_humidity %',
                              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Días compostando
              SizedBox(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 0,
                          top: 0,
                          bottom: 0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              _dayOfProcess.toString(),
                              style: Theme.of(context).textTheme.headline2?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'Días compostando',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Titulo
              Center(
                child: Text(
                  'Control manual',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Tritudora
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
                    databaseComposterRef.update({'trituradora': true});
                  } else {
                    databaseComposterRef.update({'trituradora': false});
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
              const SizedBox(height: 10),

              // Ventilador
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (_fan != true) {
                        return Colors.grey;
                      }
                      return Colors.green;
                    },
                  ),
                ),
                onPressed: () {
                  if(_fan != true) {
                    databaseComposterRef.update({'fan': true});
                  } else {
                    databaseComposterRef.update({'fan': false});
                  }
                },
                child: Text(
                  'Ventilador',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Mezcladora
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
                    databaseComposterRef.update({'mezcladora': true});
                    /*
                    flutterLocalNotificationsPlugin.show(
                        0,
                        "Prendiste la mezcladora",
                        "No te olvides de apagarla",
                        NotificationDetails(
                            android: AndroidNotificationDetails(channel.id, channel.name,
                                channelDescription: channel.description,
                                importance: Importance.high,
                                color: Colors.blue,
                                playSound: true,
                                icon: '@mipmap/ic_launcher')));

                     */
                  } else {
                    databaseComposterRef.update({'mezcladora': false});
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

              // Gráficos
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    SfCartesianChart(
                      title: ChartTitle(
                        text: 'Historial de temperatura',
                        // Aligns the chart title to left
                        alignment: ChartAlignment.center,
                        textStyle: const TextStyle(
                          color: Colors.green,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )
                      ),
                      enableAxisAnimation: true,
                      primaryXAxis: DateTimeAxis(
                        title: AxisTitle(
                          text: 'Tiempo [días]',
                          textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                          ),
                        ),
                        minorTicksPerInterval:2,

                      ),
                      primaryYAxis: NumericAxis(
                          title: AxisTitle(
                              text: 'Temperatura [ºC]',
                              textStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                              )
                          )
                      ),
                      tooltipBehavior:  _tooltipBehaviorTemperature,
                      zoomPanBehavior: _zoomPanBehaviorTemperature,
                      series: <ChartSeries<_ChartData, DateTime>>[
                        LineSeries<_ChartData, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          pointColorMapper: (_ChartData data, _) => Colors.green,
                          enableTooltip: true,
                        ),
                      ],
                    ),
                    SfCartesianChart(
                      title: ChartTitle(
                          text: 'Historial de humedad',
                          // Aligns the chart title to left
                          alignment: ChartAlignment.center,
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )
                      ),
                      enableAxisAnimation: true,
                      primaryXAxis: DateTimeAxis(
                        title: AxisTitle(
                          text: 'Tiempo [días]',
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                        minorTicksPerInterval:2,
                      ),
                      primaryYAxis: NumericAxis(
                        title: AxisTitle(
                          text: 'Humedad [%]',
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                          ),
                        ),
                        visibleMinimum: 0,
                      ),
                      tooltipBehavior:  _tooltipBehaviorHumidity,
                      zoomPanBehavior: _zoomPanBehaviorHumidity,
                      series: <ChartSeries<_ChartData, DateTime>>[
                        LineSeries<_ChartData, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          pointColorMapper: (_ChartData data, _) => Colors.green,
                          enableTooltip: true,
                        ),
                      ],
                    ),
                  ],
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

class _ChartData {
  _ChartData({this.x, this.y});
  final DateTime? x;
  final int? y;
}

class _CompostProcess {
  _CompostProcess({this.startDay});
  final DateTime? startDay;
}



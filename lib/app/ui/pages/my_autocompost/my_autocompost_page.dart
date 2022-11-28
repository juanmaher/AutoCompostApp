import 'package:autocompost/app/domain/inputs/sign_up.dart';
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

  //Holds the data source of chart
  List<_ChartData> chartData = <_ChartData>[];

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

  List<_ChartData> chartList = <_ChartData>[];
  List<Item> _books = generateItems(1);

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
              SizedBox(
                height: 100,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 0,
                          top: 20,
                          bottom: 20,
                        ),
                        children: [
                          Text(
                            'Temperatura',
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Actual: $_temperature ºC',
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                      height: size.height * 0.2 - 27,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 0,
                          top: 20,
                          bottom: 20,
                        ),
                        children: [
                          Text(
                            'Humedad',
                            style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Actual: $_humidity %',
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                      series: <ChartSeries<_ChartData, DateTime>>[
                        LineSeries<_ChartData, DateTime>(
                            dataSource: chartData,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            pointColorMapper: (_ChartData data, _) => Colors.green
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
                      series: <ChartSeries<_ChartData, DateTime>>[
                        LineSeries<_ChartData, DateTime>(
                            dataSource: chartData,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            pointColorMapper: (_ChartData data, _) => Colors.green
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

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _books[index].isExpanded = !isExpanded;
        });
      },
      children: _books.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Book $index',
      expandedValue: 'Details for Book $index goes here',
    );
  });
}

class _ChartData {
  _ChartData({this.x, this.y});
  final DateTime? x;
  final int? y;
}
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/ui/pages/my_autocompost/my_autocompost_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:autocompost/app/utils/composter_id_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DynamicTabContent {
  IconData icon;
  String tooTip;

  DynamicTabContent.name(this.icon, this.tooTip);
}

class MyComposterPage extends StatefulWidget {
  const MyComposterPage({super.key});

  @override
  State<MyComposterPage> createState() => _MyComposterPageState();
}

class _MyComposterPageState extends State<MyComposterPage> with TickerProviderStateMixin {

  int initPosition = 0;

  Future<void> addComposterDialog(
      BuildContext context, {
        String? title,
        String okText = "OK",
      }) {

    String newComposterId = '';

    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: title != null
            ? Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ) : null,
        content: CupertinoTextField(
          onChanged: (text) {
            newComposterId = text;
          },
          prefix: const Text(
            'ID Compostera',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: const BoxDecoration(),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () async {
              if(await isValidComposterId(newComposterId)) {
                bool isRepeated = false;
                for (var value in userData.composterIds) {
                  if(value == newComposterId) {
                    isRepeated = true;
                  }
                }
                if (isRepeated == false) {
                  final userUid = sessionProvider.read.user!.uid;
                  FirebaseDatabase.instance.ref().child('/users/$userUid').update({'composters_ids/$newComposterId': newComposterId});
                  setState(() {
                    userData.composterIds.add(newComposterId);
                  });
                  print(userData.composterIds);
                } else {
                  Fluttertoast.showToast(
                    msg: "ID repetido",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              } else {
                Fluttertoast.showToast(
                  msg: "ID inválido",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
              Navigator.pop(_);
              router.pushNamedAndRemoveUntil(Routes.HOME);
            },
            child: Text(
              okText,
            ),
          ),
        ],
      ),
    );

  }

  Future<void> removeComposterDialog(
      BuildContext context, {
        String? title,
        String okText = "OK",
      }) {

    String removeComposterId = '';

    return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: title != null
            ? Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ) : null,
        content: CupertinoTextField(
          onChanged: (text) {
            removeComposterId = text;
          },
          prefix: const Text(
            'ID Compostera',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: const BoxDecoration(),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () async {
              if(await isValidComposterId(removeComposterId)) {
                final String userUid = sessionProvider.read.user!.uid;
                FirebaseDatabase.instance.ref().child('/users/$userUid/composters_ids/$removeComposterId').remove();
                setState(() {
                  userData.composterIds.removeWhere((item) => item == removeComposterId);
                });
              } else {
                Fluttertoast.showToast(
                  msg: "ID inválido",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
              Navigator.pop(_);
              router.pushNamedAndRemoveUntil(Routes.HOME);
            },
            child: Text(
              okText,
            ),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Compostera'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.pushNamedAndRemoveUntil(Routes.HOME);
          },
        ),
      ),
      body: SafeArea(
        child: CustomTabView(
          initPosition: initPosition,
          itemCount: userData.composterIds.length,
          tabBuilder: (context, index) => Tab(text: userData.composterIds[index]),
          pageBuilder: (context, index) => MyAutoCompostPage(userData.composterIds[index]),
          onPositionChange: (index){
            print('current position: $index');
            initPosition = index;
          },
          onScroll: (position) => print('$position'), stub: null,
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green,
        overlayColor: Colors.green,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            label: 'Agregar compostera',
            onTap: () {
              addComposterDialog(
                context,
                title: 'Agrega una compostera',
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.remove),
            backgroundColor: Colors.green,
            label: 'Quitar compostera',
            onTap: () {
              removeComposterDialog(
                context,
                title: 'Quitar una compostera',
              );
            },
          ),
        ],
      ),


    );
  }
}

/// Implementation

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget? stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int initPosition;

  const CustomTabView({
    super.key,
    required this.stub,
    required this.onPositionChange,
    required this.onScroll,
    required this.initPosition,
    required this.itemCount,
    required this.tabBuilder,
    required this.pageBuilder,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();


}

class _CustomTabsState extends State<CustomTabView> with TickerProviderStateMixin {
  late TabController controller;
  late int _currentCount;
  late int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation!.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation!.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 :
        _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_){
            if(mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }
      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation!.addListener(onScroll);
      });
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation!.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).hintColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
                  (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
                  (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll(controller.animation!.value);
    }
  }
}
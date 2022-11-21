import 'dart:async';
import 'package:autocompost/app/ui/pages/request_permission/request_permission_controller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../routes/routes.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({Key? key}) : super(key: key);

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> with WidgetsBindingObserver{
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  /*Para evitar que maps se renderice dos veces*/
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        switch(status) {
          case PermissionStatus.granted:
            Navigator.pushReplacementNamed(context, Routes.MAPS);
            break;
          case PermissionStatus.permanentlyDenied:
            showDialog(
                context: context,
                builder: (_)=> AlertDialog(
                  title: const Text("INFO"),
                  content: const Text("No se pudo obtener el acceso a la ubicacion y son necesarios para poder continuar."),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          _fromSettings = await openAppSettings();
                        },
                        child: const Text("Ir a configuracion"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")
                    ),
                  ],
                ),
            );
            break;
        }
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _fromSettings){
      final status = await _controller.check();
      if(status == PermissionStatus.granted){
        _goToMaps();
      }
    }
    _fromSettings = false;
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    _controller.dispose();
    _subscription.cancel();
  }

  void _goToMaps(){
    Navigator.pushReplacementNamed(context, Routes.MAPS);
  }

  @override
  Widget build(BuildContext context) {
   _controller.request(); // Permite preguntar antes
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text("Ir al mapa"),
            onPressed: () {
              _controller.request();
            },
          ),
        ),
      ),
    );
  }
}
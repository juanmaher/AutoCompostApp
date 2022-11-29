import 'dart:developer';

import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/routes.dart';

class SplashController extends SimpleNotifier {

  final SessionController _sessionController;
  final _authRepository = Get.find<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._sessionController) {
    _init();
  }

  void _init() async {
    final user = await _authRepository.user;
    //Si es != null es porque tenemos una sesion activa en el dispositivo
    if(user != null) {
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.LOGIN;
    }
    notify();
  }
}
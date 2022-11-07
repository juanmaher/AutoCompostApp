import 'dart:developer';

import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/routes.dart';

class SplashController extends SimpleNotifier {

  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission) {
    _init();
  }

  final _authRepository = Get.find<AuthenticationRepository>();

  void _init() async {
    final user = await _authRepository.user;
    //Si es != null es porque tenemos una sesion activa en el dispositivo
    _routeName = user != null ? Routes.HOME : Routes.LOGIN;
    notify();
  }

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted?Routes.HOME:Routes.PERMISSIONS;
    notify();
  }
}
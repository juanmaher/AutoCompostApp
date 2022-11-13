import 'dart:developer';

import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/routes.dart';

class SplashController extends SimpleNotifier {

  String? _routeName;
  String? get routeName => _routeName;

  SplashController() {
    _init();
  }

  final _authRepository = Get.find<AuthenticationRepository>();

  void _init() async {
    final user = await _authRepository.user;
    //Si es != null es porque tenemos una sesion activa en el dispositivo
    _routeName = user != null ? Routes.HOME : Routes.LOGIN;
    notify();
  }
}
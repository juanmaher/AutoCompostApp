import 'dart:async';

import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/domain/repositories/bind_composter_repository.dart';
import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/ui/pages/login/utils/send_login_form.dart';
import 'package:autocompost/app/ui/pages/register/utils/send_register_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_meedu/meedu.dart';

class BindComposterRepositoryImpl implements BindComposterRepository {

  final FirebaseDatabase _database;

  BindComposterRepositoryImpl(this._database);

  get userUid => null;


  @override
  Future<void> bindComposterWithSerial(String composterSerial) async {

    final userUid = sessionProvider.read.user!.uid;

    DatabaseReference ref = _database.ref('/users/$userUid');
    await ref.update({'composters_ids/$composterSerial': composterSerial});
  }
}
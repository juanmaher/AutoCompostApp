import 'package:autocompost/app/domain/repositories/bind_composter_repository.dart';
import 'package:autocompost/app/ui/pages/home/home_page.dart';
import 'package:autocompost/app/utils/composter_id_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';

class MyAutoCompostLoginController extends SimpleNotifier {
  String _composterId = '';
  final _bindComposterRepository = Get.find<BindComposterRepository>();

  final GlobalKey<FormState> formKey = GlobalKey();

  void onComposterIdChanged(String text) {
    _composterId = text;
    //composterId = _composterId;
  }

  void submit() {
    return _bindComposterRepository.bindComposterWithSerial(
        _composterId
    );
  }

  Future<bool> validateComposterId() {
    return isValidComposterId(_composterId);
  }
}
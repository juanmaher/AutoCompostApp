import 'package:autocompost/app/ui/pages/login/login_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    final response = await controller.submit();
    if(response.error == null) {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
import 'package:autocompost/app/ui/pages/register/register_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

Future <void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if(isValidForm) {
    final response = await controller.submit();
    if(response.error != null) {

    } else {
      router.pushNamedAndRemoveUntil(
        Routes.HOME,
      );
    }
   } else {

  }
}
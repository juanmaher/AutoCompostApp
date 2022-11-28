import 'package:autocompost/app/ui/pages/register/register_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:autocompost/app/utils/composter_id_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future <void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if(isValidForm) {
    final response = await controller.submit();
    if(response.error != null) {

    } else {
      //final isValidComposterId = controller.validateComposterId();
      //if (await isValidComposterId) {
        controller.submit();
        router.pushNamedAndRemoveUntil(Routes.HOME);
      //} else {
        //Fluttertoast.showToast(
            //msg: "Invalid Composter ID",
            //toastLength: Toast.LENGTH_SHORT,
            //gravity: ToastGravity.CENTER,
            //timeInSecForIosWeb: 1,
            //backgroundColor: Colors.red,
            //textColor: Colors.white,
            //fontSize: 16.0
        //);
     // }
    }
   }
}
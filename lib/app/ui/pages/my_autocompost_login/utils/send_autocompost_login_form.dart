import 'package:autocompost/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:autocompost/app/ui/pages/my_autocompost_login/my_autocompost_login_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> sendAutoCompostLoginForm(BuildContext context) async {
  final controller = myCompostProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.validateComposterId();
    router.pop();
    if(response == false) {
      Fluttertoast.showToast(
          msg: "Invalid Composter ID",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      controller.submit();
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  }
}
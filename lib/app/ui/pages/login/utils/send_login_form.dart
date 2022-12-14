import 'package:autocompost/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:autocompost/app/ui/pages/login/login_page.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:fluttertoast/fluttertoast.dart';

String? userUidLogin = null;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if(response.error == null) {
      router.pushReplacementNamed(Routes.HOME);
      userUidLogin = response.user!.uid;
    } else {
      Fluttertoast.showToast(
        msg: "Contraseña o mail inválidos",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
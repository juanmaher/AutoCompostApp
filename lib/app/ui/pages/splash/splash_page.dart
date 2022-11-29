import 'package:autocompost/app/ui/global_controllers/session_controller.dart';
import 'package:autocompost/app/ui/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

final splashProvider = SimpleProvider(
        (_) => SplashController(sessionProvider.read),
);

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        onChange: (_,controller) {
          final routeName = controller.routeName;
          if(routeName != null) {
            //Con esto navego a login o a home
            router.pushReplacementNamed(routeName);
          }
        },
        builder: (_, __) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
    );
  }
}

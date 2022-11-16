import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/pages/home/home_controller.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("HOME PAGE"),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: const Text("sign out"),
              onPressed: () async {
                await Get.find<AuthenticationRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: const Text("maps"),
              onPressed: () {
                router.pushNamed(Routes.PERMISSIONS);
              },
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Colors.green,
              child: const Text("List"),
              onPressed: () {
                router.pushNamed(Routes.LIST);
              },
            )
          ],
        ),
      ),
    );
  }
}

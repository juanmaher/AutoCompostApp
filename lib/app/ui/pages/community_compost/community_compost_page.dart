import 'package:autocompost/app/domain/repositories/auth_repository.dart';
import 'package:autocompost/app/ui/pages/home/home_controller.dart';
import 'package:autocompost/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class CommunityCompostPage extends StatefulWidget {
  const CommunityCompostPage({Key? key}) : super(key: key);

  @override
  State<CommunityCompostPage> createState() => _CommunityCompostPage();
}

class _CommunityCompostPage extends State<CommunityCompostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Composteras Comunitarias"),
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

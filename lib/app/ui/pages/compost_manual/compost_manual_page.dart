import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:autocompost/app/ui/pages/list/list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompostManualPage extends StatefulWidget {
  const CompostManualPage({Key? key}) : super(key: key);

  @override
  State<CompostManualPage> createState() => _CompostManualPage();
}

class _CompostManualPage extends State<CompostManualPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manual de compostaje'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() => ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return ListTile(

      );
    },
  );



}
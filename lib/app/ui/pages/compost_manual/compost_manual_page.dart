import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/pages/compost_manual/ManualOptionList.dart';
import 'package:autocompost/app/ui/pages/compost_manual/ManualOptions.dart';
import 'package:flutter_meedu/ui.dart';
import '../../routes/routes.dart';

class CompostManualPage extends StatefulWidget {
  const CompostManualPage({Key? key}) : super(key: key);

  @override
  State<CompostManualPage> createState() => _CompostManualPage();
}

class _CompostManualPage extends State<CompostManualPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
      child: Column(
         children: <Widget>[
           Expanded(
             child: GridView.builder(
                 itemCount: manualOptions.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   mainAxisSpacing: 10,
                   childAspectRatio: 2 // Mas grande mas chico se hace
                 ),
                 itemBuilder: (context, index) {
                   return ManualOptionList( manualOption: manualOptions[index]);
                 }
             ),
           ),
         ],
        ),
      ),
    );
  }
}



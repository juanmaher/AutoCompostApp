import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/pages/compost_manual/ManualOptionList.dart';
import 'package:autocompost/app/ui/pages/compost_manual/ManualOptions.dart';


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
        title: const Text('Aprende'),
      ),
      body: Center(
      child: Column(
         children: <Widget>[
           Expanded(
             child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 5, vertical: 5),
               child: GridView.builder(
                   itemCount: manualOptions.length,
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 1,
                     mainAxisSpacing: 10,
                     childAspectRatio: 2
                   ),
                   itemBuilder: (context, index) {
                     return ManualOptionList(
                         manualOption: manualOptions[index]
                     );
                   }
               ),
           ),
          ),
         ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:autocompost/app/ui/pages/list/list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Composteras comunitarias'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() => ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          visualDensity: VisualDensity(vertical: 4),
          leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/composteras_comunitarias/compostera_$index.jpg'),
            ),
          title: Text(item),
          subtitle: Text(subtitle[index]),
          onTap: () => selectItem(directions[index]),
        );
       },
      );

  //Internal functions
  void selectItem(String address){
      _launchMap(address);
  }

  void _launchMap(String adr) async{

    final Uri googleMapsUrl = Uri.parse(adr);

    if(await canLaunchUrl(googleMapsUrl)){
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalNonBrowserApplication,);
    } else {
      throw 'No se pudo abrir';
    }
  }

}

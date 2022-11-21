import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:autocompost/app/ui/pages/list/list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final String lat = "25.3622";
  final String lng = "86.8835";

  Location location = Location();

  List<String> items = [
    'Comuna 1',
    'Comuna 2',
    'Comuna 3',
    'Comuna 4',
    'Comuna 5',
    'Comuna 6',
    'Comuna 7',
    'Comuna 8',
    'Comuna 9',
    'Comuna 10',
    'Comuna 11',
    'Comuna 12',
    'Comuna 13',
    'Comuna 14',
    'Comuna 15',
  ];

  List<String> subtitle = [
    'Plaza Rosario Vera Peñaloza (Av. San Juan y Chacabuco).',
    'Plaza Monseñor de Andrea (Cabrera entre Anchorena y Paraguay).',
    'Plaza 1ro de Mayo (Hipólito Yrigoyen y Pasco).',
    'Estación Buenos Aires (Suárez y Monasterio).',
    'Plaza Boedo (Estados Unidos 3300).',
    'Plaza Irlanda (Donato Álvarez y Gaona).',
    'Plaza de los Periodistas (Nazca y Neuquén). No está ubicada en el Punto Verde.',
    'Barrio Olímpico: (Camet y 23 de Junio).',
    'Santojanni (Acassuso y Av. Lisandro de la Torre).',
    'Plaza Toscaneras de Villa Real (Ramón Lista y Moliere).',
    'Plaza Arenales (Mercedes 4058).',
    'Plaza Echeverría (Dr. Pedro Ignacio Rivera y Bauness).',
    'Parque de las Naciones (Av. Figueroa Alcorta y Echeverría).',
    'Plaza Güemes: (Salguero y Charcas).',
    'Plaza Benito Nazar (Antezana y Olaya).',
  ];

  List<String> directions = [
    'comgooglemaps://?center=-34.622,-58.377'
    'https://www.google.com/maps/place/Plaza+Rosario+Vera+Pe%C3%B1aloza/@-34.622164,-58.3779597,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccb2c394d78bf:0xd94a9d25735bb6c7!8m2!3d-34.622164!4d-58.375771!16s%2Fg%2F11bz_3vnhr',
    'https://www.google.com/maps/place/Plaza+Monse%C3%B1or+Miguel+de+Andrea/@-34.5974235,-58.4093962,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcca8e352312eb:0x41ea1e5f4f2d7e87!8m2!3d-34.5974235!4d-58.4072075!16s%2Fg%2F11c46b2yk8',
    'https://www.google.com/maps/search/Plaza+1ro+de+Mayo+(Hip%C3%B3lito+Yrigoyen+y+Pasco)./@-34.610952,-58.399955,17z/data=!3m1!4b1',
    'https://www.google.com/maps/place/Su%C3%A1rez+%26+Monasterio,+Buenos+Aires/@-34.6441995,-58.3951463,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccb41bfb6151b:0x37043b84296074e!8m2!3d-34.6441995!4d-58.3929576!16s%2Fg%2F11j25328jp',
    'https://www.google.com/maps/place/Plaza+Mariano+Boedo/@-34.6225897,-58.4149073,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccafebe509a4f:0x1e3f138169b1d870!8m2!3d-34.6225897!4d-58.4127186!16s%2Fg%2F11b76krbgq',
    'https://www.google.com/maps/place/Plaza+Irlanda/@-34.6147828,-58.4601044,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcca1ea91fd4cf:0xbaee7969a08f24df!8m2!3d-34.6147828!4d-58.4579157!16s%2Fg%2F122whcw3',
    'https://www.google.com/maps/place/Plaza+de+los+Periodistas/@-34.6214138,-58.4751344,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcc9f288ec747f:0x9107c2ffaf2dbfb1!8m2!3d-34.6214138!4d-58.4729457!16s%2Fg%2F12hx3lz1x',
    'https://www.google.com/maps/place/Francisco+Camet+%26+23+De+Junio,+Buenos+Aires/@-34.6755178,-58.4547281,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccbf8316f29ff:0x80b4468c78a97c53!8m2!3d-34.6755178!4d-58.4525394!16s%2Fg%2F11h11z5npv',
    'https://www.google.com/maps/place/Plaza+Santojanni/@-34.6499107,-58.518348,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcc97fbf3b4caf:0x7fce1c0ea4311571!8m2!3d-34.6499107!4d-58.5161593!16s%2Fg%2F11r5ggptc4',
    'https://www.google.com/maps/search/Plaza+Toscaneras+de+Villa+Real+(Ram%C3%B3n+Lista+y+Moliere)./@-34.6164317,-58.5280638,17z/data=!3m1!4b1',
    'https://www.google.com/maps/place/Plaza+Arenales/@-34.5993652,-58.5144686,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcb7cb900aecc1:0x2ce75c056e0a7710!8m2!3d-34.5993652!4d-58.5122799!16s%2Fg%2F122pkkf6',
    'https://www.google.com/maps/place/Plaza+Echeverr%C3%ADa/@-34.5723175,-58.4920545,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcb65ef23cc8ab:0x5c73440ae1e8c91a!8m2!3d-34.5723175!4d-58.4898658!16s%2Fg%2F1hc4d8cjb',
    'https://www.google.com/maps/search/Parque+de+las+Naciones+(Av.+Figueroa+Alcorta+y+Echeverr%C3%ADa)./@-34.5665966,-58.4331532,14z/data=!3m1!4b1',
    'https://www.google.com/maps/place/Plaza+G%C3%BCemes/@-34.589437,-58.4184804,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcca806673ccbf:0x3ef7dec7a3c15c2e!8m2!3d-34.589437!4d-58.4162917!16s%2Fg%2F1td494xk',
    'https://www.google.com/maps/search/Plaza+Benito+Nazar+(Antezana+y+Olaya)./@-34.6048019,-58.4472511,17z/data=!3m1!4b1',
  ];

  void _launchMap(String adr) async{
    final Uri googleMapsUrl = Uri.parse(adr);

    if(await canLaunchUrl(googleMapsUrl)){
      await launchUrl(googleMapsUrl);
    } else {
      print('No se pudo abrir');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildList(),
    );
  }

  Widget buildList() => ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: Container(
            height: 200,
            width: 80,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/compostera_$index.jpg'),
            ),
          ),

          title: Text(item),
          subtitle: Text(subtitle[index]),
          onTap: () => selectItem(directions[index]),
        );
       },
      );

  void selectItem(String address){
      _launchMap(address);
  }
}

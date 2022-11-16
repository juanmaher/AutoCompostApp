import 'package:autocompost/app/ui/pages/list/list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/compostera_$index.jpg'),
          ),
          title: Text(item),
          subtitle: Text(subtitle[index]),
          onTap: () => selectItem(item),
        );
       },
      );

  void selectItem(String item){

  }
}

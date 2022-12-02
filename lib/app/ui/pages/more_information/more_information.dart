import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInformation {
  final int? id;
  final String title, subtitle, imageSrc, link;

  MoreInformation(
      { this.id,
        this.title = "0",
        this.subtitle = "0",
        this.imageSrc = "0",
        this.link = "0",
      });
}

List<MoreInformation> moreInformation = [
  MoreInformation(
    id: 1,
    title: 'Relacion seco-humedo',
    subtitle: 'Conocé más acerca de la humedad del compost.',
    imageSrc: "assets/images/link_icon.svg",
    link: 'http://www.compostadores.com/descubre-el-compostaje/compostar-hacer-compost/146-la-humedad-en-el-compostador.html',
  ),

  MoreInformation(
    id: 2,
    title: 'Compost a nivel industrial',
    subtitle: 'Conocé más acerca del compostaje a nivel industrial.',
    imageSrc: "assets/images/link_icon.svg",
    link: 'https://estoesagricultura.com/como-hacer-compost/',
  ),

  MoreInformation(
    id: 3,
    title: 'Insectos en el compost',
    subtitle: 'Conocé más acerca de los insectos que intervienen en el compost.',
    imageSrc: "assets/images/link_icon.svg",
    link: 'https://www.agromatica.es/que-fauna-interviene-en-el-compost/',
  ),

];


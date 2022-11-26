import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/routes/routes.dart';

class ManualOptions {
  final int? id;
  final String title, description, imageSrc, routePage;
  final Color? color;

  ManualOptions(
      { this.id,
        this.title = "0",
        this.description="0",
        this.imageSrc="0",
        this.color,
        this.routePage="0",
      });
}

List<ManualOptions> manualOptions = [
  ManualOptions(
    id: 1,
    title: "Paso a Paso",
    description: "Guia de pasos a seguir para realizar correctamente el proceso de compostado",
    imageSrc: "assets/images/manual_compost/manualOption_01.png",
    color: Color(0xFF65BD0D),
    routePage: Routes.STEPS,
  ),

  ManualOptions(
    id: 2,
    title: "Que compostar",
    description: "Lista de residuos compostables y no compostables",
    imageSrc: "assets/images/manual_compost/manualOption_02.png",
    color: Color(0xFF3F4C0B),
    routePage: Routes.COMPOSTABLES_THINGS,
  ),

  ManualOptions(
    id: 3,
    title: "Tipos de Compost",
    description: "Explicación de los diferentes tipos de compost",
    imageSrc: "assets/images/manual_compost/manualOption_03.png",
    color: Color(0xFF90A017),
    routePage: Routes.MAPS,
  ),

  ManualOptions(
    id: 4,
    title: "Consejos",
    description: "Algunos consejos que pueden ayudar a mejorar la calidad de tu compost",
    imageSrc: "assets/images/manual_compost/manualOption_04.png",
    color: Color(0xFF366403),
    routePage: Routes.HOME,
  ),

  ManualOptions(
    id: 5,
    title: "Mas información",
    description: "Infomración extra para sobre el compostaje",
    imageSrc: "assets/images/manual_compost/manualOption_05.png",
    color: Color(0xFF24421D),
    routePage: Routes.STEPS,
  ),
];
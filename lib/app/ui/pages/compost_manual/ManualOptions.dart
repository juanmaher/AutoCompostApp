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
    title: "Tipos de residuos",
    description: "Lista de residuos compostables y no compostables",
    imageSrc: "assets/images/manual_compost/manualOption_02.png",
    color: Color(0xFF189845),
    routePage: Routes.COMPOSTABLES_THINGS,
  ),

  ManualOptions(
    id: 3,
    title: "¿Qué es el compost?",
    description: "Explicación sobre qué es y cómo está compuesto",
    imageSrc: "assets/images/manual_compost/manualOption_07.png",
    color: Color(0xFF4E851F),
    routePage: Routes.ABOUT_COMPOST,
  ),

  ManualOptions(
    id: 4,
    title: "Tipos de Compost",
    description: "Explicación de los diferentes tipos de compost",
    imageSrc: "assets/images/manual_compost/manualOption_03.png",
    color: Color(0xFF90A017),
    routePage: Routes.COMPOST_TYPES,
  ),

  ManualOptions(
    id: 5,
    title: "Consejos                    ",
    description: "Algunos consejos que pueden ayudar a mejorar la calidad de tu compost",
    imageSrc: "assets/images/manual_compost/manualOption_04.png",
    color: Color(0xFF366403),
    routePage: Routes.TIPS,
  ),

  ManualOptions(
    id: 6,
    title: "Mas información",
    description: "Información extra sobre el compostaje",
    imageSrc: "assets/images/manual_compost/manualOption_05.png",
    color: Color(0xFF24421D),
    routePage: Routes.STEPS,
  ),
];
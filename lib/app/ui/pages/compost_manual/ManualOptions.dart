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
    title: "¿Qué es el compost?",
    description: "Explicación sobre qué es y cómo está compuesto",
    imageSrc: "assets/images/manual_compost/manualOption_07.png",
    color: Colors.green.shade400,
    routePage: Routes.ABOUT_COMPOST,
  ),

  ManualOptions(
    id: 2,
    title: "Paso a Paso",
    description: "Guia de pasos a seguir para realizar correctamente el proceso de compostado",
    imageSrc: "assets/images/manual_compost/manualOption_01.png",
    color: Colors.green.shade500,
    routePage: Routes.STEPS,
  ),

  ManualOptions(
    id: 3,
    title: "Tipos de residuos",
    description: "Lista de residuos compostables y no compostables",
    imageSrc: "assets/images/manual_compost/manualOption_02.png",
    color: Colors.green.shade600,
    routePage: Routes.COMPOSTABLES_THINGS,
  ),

  ManualOptions(
    id: 4,
    title: "Tipos de Compost",
    description: "Explicación de los diferentes tipos de compost",
    imageSrc: "assets/images/manual_compost/manualOption_03.png",
    color: Colors.green.shade700,
    routePage: Routes.COMPOST_TYPES,
  ),

  ManualOptions(
    id: 5,
    title: "Consejos                    ",
    description: "Algunos consejos que pueden ayudar a mejorar la calidad de tu compost",
    imageSrc: "assets/images/manual_compost/manualOption_04.png",
    color: Colors.green.shade800,
    routePage: Routes.TIPS,
  ),

  ManualOptions(
    id: 6,
    title: "Mas información",
    description: "Información extra sobre el compostaje",
    imageSrc: "assets/images/manual_compost/manualOption_05.png",
    color: Colors.green.shade900,
    routePage: Routes.MORE_INFORMATION,
  ),
];
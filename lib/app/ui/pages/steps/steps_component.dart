import 'package:flutter/material.dart';

class StepComponent {
  final int? id;
  final String title, description, imageSrc, imageIcon;
  final Color? color;

  StepComponent(
      { this.id,
        this.title = "0",
        this.description="0",
        this.imageSrc="0",
        this.imageIcon="0",
        this.color,
      });
}

// Demo list
List<StepComponent> stepComponent = [
  StepComponent(
    id: 1,
    title: "1° Añadir Secos",
    description: "Cargar el módulo de la compostera con material seco (Pasto seco, hojas secas, viruta, papel o cartón trozado).",
    imageSrc: "assets/images/steps/step_01.jpg",
    imageIcon: "assets/images/steps/step_01.png",
    color: Color(0xFF704503),
  ),

  StepComponent(
    id: 2,
    title: "2° Residuos orgánicos",
    description: "Incorporá diariamente los residuos orgánicos vegetales de la cocina (yerba, café, cascaras de fruta, de verdura, fósforos usados, restos de comida, etc).",
    imageSrc: "assets/images/steps/step_02.jpg",
    imageIcon: "assets/images/steps/step_02.png",
    color: Color(0xFF3F4C0B),
  ),

  StepComponent(
    id: 3,
    title: "3° Girar",
    description: "Girá la compostera al menos una vez por día, o cada vez que agregues nuevos residuos orgánicos.",
    imageSrc: "assets/images/steps/step_03.jpg",
    imageIcon: "assets/images/steps/step_03.png",
    color: Color(0xFF90A017),
  ),

  StepComponent(
    id: 4,
    title: "4° Repetir el proceso",
    description: "Al llenar un módulo, retirá la compuerta y repetí el proceso, mientras el compost producido «descansa»",
    imageSrc: "assets/images/steps/step_04.jpg",
    imageIcon: "assets/images/steps/step_04.png",
    color: Color(0xFF366403),
  ),

  StepComponent(
    id: 5,
    title: "5° Maduración",
    description: "Al llenar por segunda vez el módulo, retirá el compost del cajón de maduración y abri la compuerta para vertir el nuevo contenido en el cajón de maduración.",
    imageSrc: "assets/images/steps/step_05.jpg",
    imageIcon: "assets/images/steps/step_05.png",
    color: Color(0xFF24421D),
  ),

  StepComponent(
    id: 6,
    title: "6° Volver a empezar",
    description: "Repetir el proceso nuevamente haste que se llene el módulo.",
    imageSrc: "assets/images/steps/step_06.jpg",
    imageIcon: "assets/images/steps/step_06.png",
    color: Color(0xFF24421D),
  ),
];
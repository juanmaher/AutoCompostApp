import 'package:flutter/material.dart';

class StepComponent {
  final int? id;
  final String title, description, imageSrc;
  final Color? color;

  StepComponent(
      { this.id,
        this.title = "0",
        this.description="0",
        this.imageSrc="0",
        this.color,
      });
}

// Demo list
List<StepComponent> stepComponent = [
  StepComponent(
    id: 1,
    title: "Paso a Paso",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/compostera_0.jpg",
    color: Color(0xFF65BD0D),
  ),

  StepComponent(
    id: 2,
    title: "Que compostar",
    description: "Cook recipes for special occasions",
    imageSrc: "assets/images/compostera_1.jpg",
    color: Color(0xFF3F4C0B),
  ),

  StepComponent(
    id: 3,
    title: "Tipos de Compost",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/compostera_2.jpg",
    color: Color(0xFF90A017),
  ),

  StepComponent(
    id: 4,
    title: "Consejos",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/compostera_3.jpg",
    color: Color(0xFF366403),
  ),

  StepComponent(
    id: 5,
    title: "Mas información",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/compostera_4.jpg",
    color: Color(0xFF24421D),
  ),
];
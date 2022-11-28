import 'package:flutter/material.dart';

class NoCompostables {
  final int? id;
  final String title, imageSrc;

  NoCompostables(
      { this.id,
        this.title = "0",
        this.imageSrc="0",
      });
}

List<NoCompostables> noCompostables = [
  NoCompostables(
    id: 1,
    title: 'Carne y huesos',
    imageSrc: "assets/images/no_compostables/no_compostable_01.png",
  ),

  NoCompostables(
    id: 2,
    title: 'Pescados',
    imageSrc: "assets/images/no_compostables/no_compostable_02.png",
  ),

  NoCompostables(
    id: 3,
    title: 'Productos químicos',
    imageSrc: "assets/images/no_compostables/no_compostable_03.png",
  ),

  NoCompostables(
    id: 4,
    title: 'Harinas y panes',
    imageSrc: "assets/images/no_compostables/no_compostable_04.png",
  ),

  NoCompostables(
    id: 5,
    title: 'Grasas y aceites',
    imageSrc: "assets/images/no_compostables/no_compostable_05.png",
  ),

  NoCompostables(
    id: 6,
    title: 'Lácteos',
    imageSrc: "assets/images/no_compostables/no_compostable_06.png",
  ),

  NoCompostables(
    id: 7,
    title: 'Materiales sintéticos',
    imageSrc: "assets/images/no_compostables/no_compostable_07.png",
  ),

  NoCompostables(
    id: 8,
    title: 'Comidas elaboradas o condimentadas',
    imageSrc: "assets/images/no_compostables/no_compostable_08.png",
  ),

  NoCompostables(
    id: 9,
    title: 'Excremento de animales domésticos',
    imageSrc: "assets/images/no_compostables/no_compostable_09.png",
  ),

  NoCompostables(
    id: 10,
    title: 'Colillas de cigarrillo',
    imageSrc: "assets/images/no_compostables/no_compostable_10.png",
  ),
  
];


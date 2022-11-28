import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/routes/routes.dart';

class Compostables {
  final int? id;
  final String title, imageSrc;

  Compostables(
      { this.id,
        this.title = "0",
        this.imageSrc="0",
      });
}

List<Compostables> compostables = [
  Compostables(
    id: 1,
    title: 'Restos de frutas y verdura',
    imageSrc: "assets/images/compostables/compostable_01.png",
  ),

  Compostables(
    id: 2,
    title: 'Cascaras de huevos trituradas',
    imageSrc: "assets/images/compostables/compostable_02.png",
  ),

  Compostables(
    id: 3,
    title: 'Corcho',
    imageSrc: "assets/images/compostables/compostable_03.png",
  ),

  Compostables(
    id: 4,
    title: 'Papeles y cartones sin tinta',
    imageSrc: "assets/images/compostables/compostable_04.png",
  ),

  Compostables(
    id: 5,
    title: 'Periódicos',
    imageSrc: "assets/images/compostables/compostable_05.png",
  ),

  Compostables(
    id: 6,
    title: 'Café',
    imageSrc: "assets/images/compostables/compostable_06.png",
  ),

  Compostables(
    id: 7,
    title: 'Té',
    imageSrc: "assets/images/compostables/compostable_07.png",
  ),

  Compostables(
    id: 8,
    title: 'Yerba',
    imageSrc: "assets/images/compostables/compostable_08.png",
  ),

  Compostables(
    id: 9,
    title: 'Césped',
    imageSrc: "assets/images/compostables/compostable_09.png",
  ),

  Compostables(
    id: 10,
    title: 'Flores',
    imageSrc: "assets/images/compostables/compostable_10.png",
  ),

  Compostables(
    id: 11,
    title: 'Hojas',
    imageSrc: "assets/images/compostables/compostable_11.png",
  ),

  Compostables(
    id: 12,
    title: 'Aserrín',
    imageSrc: "assets/images/compostables/compostable_12.png",
  ),

  Compostables(
    id: 13,
    title: 'Excremento de animales con dieta a base de plantas',
    imageSrc: "assets/images/compostables/compostable_13.png",
  ),

  Compostables(
    id: 14,
    title: 'Fósforos usados',
    imageSrc: "assets/images/compostables/compostable_14.png",
  ),

  Compostables(
    id: 15,
    title: 'Pelos y pelusas',
    imageSrc: "assets/images/compostables/compostable_15.png",
  ),
];



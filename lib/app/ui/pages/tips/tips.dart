import 'package:flutter/material.dart';

class Tips {
  final int? id;
  final String title, subtitle, imageSrc;

  Tips(
      { this.id,
        this.title = "0",
        this.subtitle = "0",
        this.imageSrc="0",
      });
}

List<Tips> tips = [
  Tips(
    id: 1,
    title: 'Usar una mezcla balanceada',
    subtitle: 'La relación entre residuos orgánicos y secos debe ser equitativa para mejorar la oxigención del compost.',
    imageSrc: "assets/images/tips/tips_01.png",
  ),

  Tips(
    id: 2,
    title: 'Utilizar diversos resto de comida',
    subtitle: 'Mientras mayor sea la diversidad de resiudos, mejor será la calidad del compost.',
    imageSrc: "assets/images/tips/tips_02.png",
  ),

  Tips(
    id: 3,
    title: 'Cortar los residuos en pequeños pedazos',
    subtitle: 'Mientras menor tamaño tengan los residuos, más rápida será su descomposición.',
    imageSrc: "assets/images/tips/tips_03.png",
  ),

  Tips(
    id: 4,
    title: 'Mezclar repetidas veces',
    subtitle: 'Para todos los compostajes, salvo el lombricompost, mientras que más lo mezcles mas oxigenación tendrá '
        'la mezcla y mas eficiente será su descomposición.',
    imageSrc: "assets/images/tips/tips_04.png",
  ),

  Tips(
    id: 5,
    title: 'Cuidar la humedad de tus residuos',
    subtitle: 'Es importante que los residuos orgánicos no esten mojados pero que si tengan humedad al incoporarlos a la mezcla.',
    imageSrc: "assets/images/tips/tips_05.png",
  ),

  Tips(
    id: 6,
    title: 'Cuidar la temperatura de la mezcla',
    subtitle: 'Dejar la compostera a temperatura ambiente y evitar lugares que tengan incidencia directa de los rayos de sol o que sean demasiado fríos.',
    imageSrc: "assets/images/tips/tips_06.png",
  ),

  Tips(
    id: 7,
    title: 'Controlar los malos olores',
    subtitle: 'Dado que es un proceso de descomposición pueden existir la generación de malos olores, sin embargo los'
        ' fuertes malos olores indican la falta de oxigenación de la mezcla.',
    imageSrc: "assets/images/tips/tips_07.png",
  ),
  Tips(
    id: 8,
    title: 'No dejar de agregar residuos',
    subtitle: 'Para obtener una buena cantidad de compost, se deben agregar cada vez más residuos y mezclarlos con lo '
        'antiguos para que la degradación total sea más rápida.',
    imageSrc: "assets/images/tips/tips_08.png",
  ),

];
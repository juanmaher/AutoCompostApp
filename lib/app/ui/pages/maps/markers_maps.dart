import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/routes/routes.dart';

class MarkersMaps {
  final int id;
  final double lat, lng;
  final String title, address, url;

  MarkersMaps(
      { this.id = 0,
        this.lng=0,
        this.lat=0,
        this.title = "0",
        this.address="0",
        this.url="0",
      });
}

List<MarkersMaps> markersMaps = [
  MarkersMaps(
    id: 1,
    title: 'Comuna 1',
    address: 'Av. San Juan y Chacabuco',
    url: 'https://www.google.com/maps/place/Plaza+Rosario+Vera+Pe%C3%B1aloza/@-34.6221596,-58.3779597,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccb2c394d78bf:0xd94a9d25735bb6c7!8m2!3d-34.622164!4d-58.375771!16s%2Fg%2F11bz_3vnhr',
    lat: -34.6221596,
    lng: -58.3779597,
  ),

  MarkersMaps(
    id: 2,
    title: 'Comuna 2',
    address: 'Cabrera entre Anchorena y Paraguay',
    url: 'https://www.google.com/maps/place/Plaza+Monse%C3%B1or+Miguel+de+Andrea/@-34.5974235,-58.4093962,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcca8e352312eb:0x41ea1e5f4f2d7e87!8m2!3d-34.5974235!4d-58.4072075!16s%2Fg%2F11c46b2yk8',
    lat: -34.5974235,
    lng: -58.4093962,
  ),

  MarkersMaps(
    id: 3,
    title: 'Comuna 3',
    address: 'Hipólito Yrigoyen y Pasco',
    url: 'https://www.google.com/maps/search/Plaza+1ro+de+Mayo+(Hip%C3%B3lito+Yrigoyen+y+Pasco)./@-34.610952,-58.399955,17z/data=!3m1!4b1',
    lat: -34.610952,
    lng: -58.399955,
  ),

  MarkersMaps(
      id: 4,
      title: 'Comuna 4',
      address: 'Suárez y Monasterio',
      url: 'https://www.google.com/maps/place/Su%C3%A1rez+%26+Monasterio,+Buenos+Aires/@-34.6441995,-58.3951463,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccb41bfb6151b:0x37043b84296074e!8m2!3d-34.6441995!4d-58.3929576!16s%2Fg%2F11j25328jp',
      lat: -34.6441995,
      lng: -58.3951463,
  ),

  MarkersMaps(
      id: 5,
      title: 'Comuna 5',
      address: 'Estados Unidos 3300',
      url: 'https://www.google.com/maps/place/Plaza+Mariano+Boedo/@-34.6225897,-58.4149073,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccafebe509a4f:0x1e3f138169b1d870!8m2!3d-34.6225897!4d-58.4127186!16s%2Fg%2F11b76krbgq',
      lat: -34.6225897,
      lng: -58.4149073,
  ),

  MarkersMaps(
      id: 6,
      title: 'Comuna 6',
      address: 'Donato Álvarez y Gaona',
      url: 'https://www.google.com/maps/place/Plaza+Irlanda/@-34.6147828,-58.4601044,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcca1ea91fd4cf:0xbaee7969a08f24df!8m2!3d-34.6147828!4d-58.4579157!16s%2Fg%2F122whcw3',
      lat: -34.6147828,
      lng: -58.4601044,
  ),

  MarkersMaps(
      id: 7,
      title: 'Comuna 7',
      address: 'Nazca y Neuquén',
      url: 'https://www.google.com/maps/place/Plaza+de+los+Periodistas/@-34.6214138,-58.4751344,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcc9f288ec747f:0x9107c2ffaf2dbfb1!8m2!3d-34.6214138!4d-58.4729457!16s%2Fg%2F12hx3lz1x',
      lat: -34.6214138,
      lng: -58.4751344,
  ),

  MarkersMaps(
      id: 8,
      title: 'Comuna 8',
      address: 'Camet y 23 de Junio',
      url: 'https://www.google.com/maps/place/Francisco+Camet+%26+23+De+Junio,+Buenos+Aires/@-34.6755178,-58.4547281,17z/data=!3m1!4b1!4m6!3m5!1s0x95bccbf8316f29ff:0x80b4468c78a97c53!8m2!3d-34.6755178!4d-58.4525394!16s%2Fg%2F11h11z5npv',
      lat: -34.6755178,
      lng: -58.4547281,
  ),

  MarkersMaps(
      id: 9,
      title: 'Comuna 9',
      address: 'Acassuso y Av. Lisandro de la Torre',
      url: 'https://www.google.com/maps/place/Plaza+Santojanni/@-34.6499107,-58.518348,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcc97fbf3b4caf:0x7fce1c0ea4311571!8m2!3d-34.6499107!4d-58.5161593!16s%2Fg%2F11r5ggptc4',
      lat: -34.6499107,
      lng: -58.518348,
  ),

  MarkersMaps(
      id: 10,
      title: 'Comuna 10',
      address: 'Ramón Lista y Moliere',
      url: 'https://www.google.com/maps/search/Plaza+Toscaneras+de+Villa+Real+(Ram%C3%B3n+Lista+y+Moliere)./@-34.6164317,-58.5280638,17z/data=!3m1!4b1',
      lat: -34.6164317,
      lng: -58.5280638,
  ),

  MarkersMaps(
      id: 11,
      title: 'Comuna 11',
      address: 'Mercedes 4058',
      url: 'https://www.google.com/maps/place/Plaza+Arenales/@-34.5993652,-58.5144686,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcb7cb900aecc1:0x2ce75c056e0a7710!8m2!3d-34.5993652!4d-58.5122799!16s%2Fg%2F122pkkf6',
      lat: -34.5993652,
      lng: -58.5144686,
  ),

  MarkersMaps(
      id: 12,
      title: 'Comuna 12',
      address: 'Dr. Pedro Ignacio Rivera y Bauness',
      url: 'https://www.google.com/maps/place/Plaza+Echeverr%C3%ADa/@-34.5723175,-58.4920545,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcb65ef23cc8ab:0x5c73440ae1e8c91a!8m2!3d-34.5723175!4d-58.4898658!16s%2Fg%2F1hc4d8cjb',
      lat: -34.5723175,
      lng: -58.4920545,
  ),

  MarkersMaps(
      id: 13,
      title: 'Comuna 13',
      address: 'Av. Figueroa Alcorta y Echeverría',
      url: 'https://www.google.com/maps/search/Parque+de+las+Naciones+(Av.+Figueroa+Alcorta+y+Echeverr%C3%ADa)./@-34.5665966,-58.4331532,14z/data=!3m1!4b1',
      lat: -34.5665966,
      lng: -58.4331532,
  ),

  MarkersMaps(
      id: 14,
      title: 'Comuna 14',
      address: 'Salguero y Charcas',
      url: 'https://www.google.com/maps/place/Plaza+G%C3%BCemes/@-34.589437,-58.4184804,17z/data=!3m1!4b1!4m6!3m5!1s0x95bcca806673ccbf:0x3ef7dec7a3c15c2e!8m2!3d-34.589437!4d-58.4162917!16s%2Fg%2F1td494xk',
      lat: -34.589437,
      lng: -58.4184804,
  ),

  MarkersMaps(
      id: 15,
      title: 'Comuna 15',
      address: 'Antezana y Olaya',
      url: 'https://www.google.com/maps/search/Plaza+Benito+Nazar+(Antezana+y+Olaya)./@-34.6048019,-58.4472511,17z/data=!3m1!4b1',
      lat: -34.6048019,
      lng: -58.4472511,
  ),

];
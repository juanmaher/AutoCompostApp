import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController {

  final initialCamaraPosition = CameraPosition(
    target: LatLng(-34.616655, -58.4622398),
    zoom: 11,
  );

  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
}
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapsController extends ChangeNotifier{

  /*Definicion de la posicion inicial del mapa*/
  final initialCamaraPosition = CameraPosition(
    target: LatLng(-34.616655, -58.4622398),
    zoom: 12,
  );

  /*Definicion de los marcadores*/
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

  bool _loading = true;
  bool get loading => _loading;

  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;

  StreamSubscription? _gpsSubscription;

  MapsController() {
    _init();
  }

  Future<void> _init() async {
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    _gpsSubscription =  Geolocator.getServiceStatusStream().listen(
      (status) {
        _gpsEnabled = status == ServiceStatus.enabled;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller){
    //controller.setMapStyle();
  }

  Future<void> turnOnGPS() => Geolocator.openLocationSettings();

  @override
  void dispose() {
    _gpsSubscription?.cancel();
    super.dispose();
  }
}
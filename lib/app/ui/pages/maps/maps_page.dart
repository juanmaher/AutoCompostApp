import 'package:autocompost/app/ui/pages/home/home_controller.dart';
import 'package:autocompost/app/ui/pages/maps/maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapsController>(
      create: (_)=>MapsController(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Mapa')),
        body: Selector<MapsController,bool>(
          selector: (_, controller) => controller.loading,
          builder: (context, loading, loadingWidget){
            if(loading){
              return loadingWidget!;
            }
            return Consumer<MapsController>(
              builder: (_,controller, gpsMessageWidget) {
                if(!controller.gpsEnabled){
                  return gpsMessageWidget!;
                }

                return GoogleMap(
                  onMapCreated: controller.onMapCreated,
                  markers: controller.markers,
                  initialCameraPosition: controller.initialCamaraPosition,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                );
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Para usar la aplicacion debe activar el GPS",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (){
                        final controller = context.read<MapsController>();
                        controller.turnOnGPS();
                      },
                      child: const Text("Encender"),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

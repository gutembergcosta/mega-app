import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int startPosition = 0;
  List<int> array = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open street maps'),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(-19.920208, -43.921435),
                  initialZoom: 9.2,
                  /*
                  interactionOptions: InteractionOptions(
                      flags:  InteractiveFlag.doubleTapDragZoom |
                              InteractiveFlag.doubleTapZoom |
                              InteractiveFlag.drag |
                              InteractiveFlag.flingAnimation |
                              InteractiveFlag.pinchZoom |
                              InteractiveFlag.scrollWheelZoom,
                  ),
                  */
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(-19.920208, -43.921435),
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/img/map-marker.png', // Replace with your image path
                        ),
                      ),
                    ],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: const [
                          LatLng(-19.92365,-43.9249368), 
                          LatLng(-19.924463, -43.922331), 
                          LatLng(-19.923546, -43.920617), 
                          LatLng(-19.923847, -43.919262), 
                          LatLng(-19.922728, -43.918978), 
                          LatLng(-19.922347, -43.920174), 
                          LatLng(-19.922070, -43.921504), 
                          LatLng(-19.921208, -43.921223), 
                          LatLng(-19.920208, -43.921435), 
                        ],
                        /*
                        points: const [
                          LatLng(-19.92365,-43.9249368), 
                          LatLng(-19.924463, -43.922331), 
                          LatLng(-19.923546, -43.920617), 
                          LatLng(-19.923847, -43.919262), 
                          LatLng(-19.922728, -43.918978), 
                          LatLng(-19.922347, -43.920174), 
                          LatLng(-19.922070, -43.921504), 
                          LatLng(-19.921208, -43.921223), 
                          LatLng(-19.920208, -43.921435), 
                        ],
                        */
                        color: Colors.red,
                        borderStrokeWidth: 3,
                        borderColor: Colors.red,
                      ),
                    ],
                  ),
                ],
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}

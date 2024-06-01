import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double startLngPosition = -4324.99368;
  List<LatLng> locais = [const LatLng(-19.92365, -4324.99300)];

  List<LatLng> locais01 = [
    LatLng(-19.92365, -43.9249368),
    LatLng(-19.924463, -43.922331),
    LatLng(-19.923546, -43.920617),
    LatLng(-19.923847, -43.919262),
    LatLng(-19.922728, -43.918978),
    //LatLng(-19.922347, -43.920174),
    //LatLng(-19.922070, -43.921504),
    //LatLng(-19.921208, -43.921223),
    //LatLng(-19.920208, -43.921435),
  ];

  void startAddingPosition(int intervalInSeconds) {
    Timer.periodic(Duration(seconds: intervalInSeconds), (timer) {
      setState(() {
        double newLngPosition = startLngPosition + 0.00137;
        print("newLngPosition: $newLngPosition");
        startLngPosition = newLngPosition;
        var novoLocal = LatLng(-19.92365, newLngPosition);
        print(novoLocal);

        locais01.add(novoLocal);
      });
    });
  }

  void addingPosition() {
      var novoLocal = LatLng(-19.920208, -43.921435);

      locais.add(novoLocal);
      //print(locais);

      //array.add(matriz);
      //array.add(DateTime.now().millisecondsSinceEpoch);
      //print(array.length); // Imprime o array para ver os elementos adicionados
      //print(array); // Imprime o array para ver os elementos adicionados
  }

  @override
  void initState() {
    super.initState();
    //startAddingPosition(2); // Adiciona um elemento ao array a cada 2 segundos
    addingPosition();
  }

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
                  initialZoom: 17,
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
                        points: locais01,
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

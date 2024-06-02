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
  MapController _mapctl = MapController();

  double startLngPosition = -43.918978;
  List<LatLng> locais = [const LatLng(-19.92365, -4324.99300)];

  LatLng inicialPosition = const LatLng(-19.920208, -43.921435);
  LatLng inicialMarkerPosition = const LatLng(-19.920208, -43.921435);
  LatLng novoLocal = const LatLng(-19.920208, -43.921435);

  List<LatLng> locais01 = [
    const LatLng(-19.92365, -43.9249368),
    const LatLng(-19.924463, -43.922331),
    const LatLng(-19.923546, -43.920617),
    const LatLng(-19.923847, -43.919262),
    const LatLng(-19.922728, -43.918978),
  ];

  void startAddingPosition(int intervalInSeconds) {
    Timer.periodic(Duration(seconds: intervalInSeconds), (timer) {
      double newLngPosition = startLngPosition + 0.00137;
      print("newLngPosition: $newLngPosition");
      startLngPosition = newLngPosition;
      var novoLocal = LatLng(-19.92365, newLngPosition);
      print(novoLocal);
      setState(() {
        locais01.add(novoLocal);
        _mapctl.move(novoLocal, 16);
        inicialMarkerPosition = novoLocal;

      });
    });
  }

  void addingPosition() {
    print('add position after timer');
    Timer(Duration(seconds: 5), () {
      setState(() {
        locais01.add(novoLocal);
        inicialPosition = novoLocal;
        //print(locais);
      });
    });
    //array.add(matriz);
    //array.add(DateTime.now().millisecondsSinceEpoch);
    //print(array.length); // Imprime o array para ver os elementos adicionados
    //print(array); // Imprime o array para ver os elementos adicionados
  }

  @override
  void initState() {
    super.initState();
    startAddingPosition(7); // Adiciona um elemento ao array a cada 2 segundos
    //addingPosition();
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
                mapController: _mapctl,
                options: MapOptions(
                  initialCenter: inicialPosition,
                  initialZoom: 16,
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
                        point: inicialMarkerPosition,
                        width: 50,
                        height: 50,
                        alignment: Alignment.topCenter,
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

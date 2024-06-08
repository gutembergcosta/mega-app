import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

class AddToArray extends StatefulWidget {
  const AddToArray({super.key});

  @override
  State<AddToArray> createState() => AddToArrayState();
}

class AddToArrayState extends State<AddToArray> {
  int startPosition = 0;
  double startLngPosition = -4324.99368;
  List<List<Object>> array = [];
  List<LatLng> locais = [];
  //var locais = [];

  void addToArray(int intervalInSeconds) {
    Timer.periodic(Duration(seconds: intervalInSeconds), (timer) {
      setState(() {
        int newPosition = startPosition + 3;
        List<int> matriz = [3, newPosition];

        array.add(matriz);
        //array.add(DateTime.now().millisecondsSinceEpoch);
        print(array.length); // Imprime o array para ver os elementos adicionados
        print(array); // Imprime o array para ver os elementos adicionados
      });
    });
  }
  void startAddingPosition(int intervalInSeconds) {
    Timer.periodic(Duration(seconds: intervalInSeconds), (timer) {
      setState(() {
        double newLngPosition = startLngPosition + 0.00137;
        print("newLngPosition: $newLngPosition");
        startLngPosition = newLngPosition;
        var novoLocal = LatLng(-19.92365, newLngPosition);
        print(novoLocal);

        //locais.add(novoLocal);
        //print(locais);

        //array.add(matriz);
        //array.add(DateTime.now().millisecondsSinceEpoch);
        //print(array.length); // Imprime o array para ver os elementos adicionados
        //print(array); // Imprime o array para ver os elementos adicionados
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startAddingPosition(2); // Adiciona um elemento ao array a cada 2 segundos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Elementos ao Array'),
      ),
      body: ListView.builder(
        itemCount: array.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Elemento: ${array[index][0]}'),
          );
        },
      ),
      /*
      body: const Center(
        child: Text('olá mundo'),
        
        child: ListView.builder(
          itemCount: array.length,
          itemBuilder: (context, index) {
            return ListTile(
              
              title: Text('Elemento: ${array[index]}'),
            );
          },
        ),
      ),
      */
    );
  }
}

import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.texto, {super.key});

  final String texto;

  @override
  Widget build(context) {
    return  Text(
      texto,
      style: const TextStyle(color: Colors.white, fontSize: 30.0),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mega_app/src/dice_roll/styled_text.dart';

var startAligment = Alignment.topLeft;
var endAligment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color01, this.color02, {super.key});

  final Color color01;
  final Color color02;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color01,
          color02,
        ], begin: startAligment, end: endAligment),
      ),
      child: const Center(
        child: StyledText('fulano'),
      ),
    );
  }
}

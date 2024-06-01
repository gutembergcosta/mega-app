import 'package:flutter/material.dart';
import 'package:mega_app/src/dice_roll/gradient_container.dart';

const color01 = Color.fromARGB(255, 5, 36, 120);
const color02 = Color.fromARGB(255, 97, 127, 209);

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GradientContainer(color01, color02));
  }
}

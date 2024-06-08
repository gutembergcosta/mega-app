import 'package:flutter/material.dart';

bool valor = false;

class HomeNotification extends StatefulWidget {
  const HomeNotification({super.key});

  @override
  State<HomeNotification> createState() => _HomeNotificationState();
}

class _HomeNotificationState extends State<HomeNotification> {
  showNotification() {
    setState(() {
      valor = !valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 174),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            child: ListTile(
                title: const Text('Lembrar mais tarde'),
                trailing: valor
                    ? Icon(Icons.check_box, color: Colors.amber.shade600)
                    : const Icon(Icons.check_box_outline_blank),
                onTap: showNotification,
                ),
          ),
        ),
      )
    );
  }
}

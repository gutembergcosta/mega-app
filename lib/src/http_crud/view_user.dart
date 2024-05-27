import 'package:flutter/material.dart';
import 'package:mega_app/models/user02.dart';
import 'package:mega_app/src/services/user_service.dart';

var userNomeController = TextEditingController();
var userInfoController = TextEditingController();
var userTextoController = TextEditingController();
var userService = UserService();

class ViewUser extends StatefulWidget {
  final User02 user;
  const ViewUser({super.key, required this.user});

  @override
  State<ViewUser> createState() => ViewUserState();
}

class ViewUserState extends State<ViewUser> {
  bool validateNome = false;
  bool validateInfo = false;
  bool validateTexto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View user'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 Text(
                  'Detalhes',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.lightBlue.shade900,
                      fontWeight: FontWeight.w600),
                ),
                ]
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child:  Text(
                    'Nome: ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue.shade900,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  widget.user.nome ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child:  Text(
                    'Info: ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue.shade900,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  widget.user.info ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 37, 37, 37),
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Texto: ',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.user.texto ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 37, 37, 37),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void clearForm() {
    userNomeController.text = '';
    userInfoController.text = '';
    userTextoController.text = '';
  }
}

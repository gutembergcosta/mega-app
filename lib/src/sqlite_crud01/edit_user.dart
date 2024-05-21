import 'package:flutter/material.dart';
import 'package:mega_app/models/user02.dart';
import 'package:mega_app/src/services/user_service.dart';

var userNomeController = TextEditingController();
var userInfoController = TextEditingController();
var userTextoController = TextEditingController();
var userService = UserService();

class EditUser extends StatefulWidget {
  final User02 user;
  const EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => EditUserState();
}

class EditUserState extends State<EditUser> {
  bool validateNome = false;
  bool validateInfo = false;
  bool validateTexto = false;

  @override
  void initState() {
    setState(() {
      userNomeController.text = widget.user.nome ?? '';
      userInfoController.text = widget.user.info ?? '';
      userTextoController.text = widget.user.texto ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit usuário'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'add new details',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: userNomeController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter name',
                    labelText: 'Name',
                    errorText:
                        validateNome ? 'O campo nome é obrigatório' : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: userInfoController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter info',
                    labelText: 'Info',
                    errorText:
                        validateInfo ? 'O campo Info é obrigatório' : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: userTextoController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Description',
                    labelText: 'Description',
                    errorText: validateTexto
                        ? 'O campo Description é obrigatório'
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        setState(() {
                          validateNome =
                              userNomeController.text.isEmpty ? true : false;
                          validateInfo =
                              userInfoController.text.isEmpty ? true : false;
                          validateTexto =
                              userTextoController.text.isEmpty ? true : false;
                        });
                        if (validateNome == false &&
                            validateInfo == false &&
                            validateTexto == false) {
                          final User02 user = User02(
                            id: widget.user.id,
                            nome: userNomeController.text,
                            info: userInfoController.text,
                            texto: userTextoController.text,
                          );
                          var result = await userService.updateUser(user);
                          Navigator.pop(context, result);
                          clearForm();

                          print("result: $result");
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        clearForm();
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void clearForm() {
    userNomeController.text = '';
    userInfoController.text = '';
    userTextoController.text = '';
  }
}

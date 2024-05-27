import 'package:flutter/material.dart';
import 'package:mega_app/src/services/user_service.dart';
import 'package:mega_app/src/sqlite_crud01/add_user.dart';
import 'package:mega_app/models/user02.dart';
import 'package:mega_app/src/sqlite_crud01/edit_user.dart';
import 'package:mega_app/src/sqlite_crud01/view_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => ListUserState();
}

class ListUserState extends State<HomePage> {
  late List<User02> userList = <User02>[];
  final userService = UserService();

  getAllUserDetails() async {
    var users = await userService.listUsers();
    userList = <User02>[];
    users.forEach((user) {
      setState(() {
        var userModel = User02();
        userModel.id = user['id'];
        userModel.nome = user['nome'];
        userModel.info = user['info'];
        userModel.texto = user['texto'];
        userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: 
                 BorderRadius.all(Radius.circular(2))),
            title: const Text(
              'Deseja excluir?',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red),
                onPressed: () async {
                  var result = await userService.deleteUser(userId);
                  if (result != null) {
                    getAllUserDetails();
                    showSuccessSnackBar(
                      'Usuário excluído com sucesso'
                    );
                  }
                },
                child: const Text('Deletar')
              ),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue.shade900),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP CRUD 01'),
      ),
      body: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewUser(user: userList[index]),
                    ),
                  );
                },
                leading: const Icon(Icons.person),
                title: Text(userList[index].nome ?? ''),
                subtitle: Text(userList[index].info ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditUser(user: userList[index]),
                            ),
                          ).then((data) {
                            if (data != null) {
                              getAllUserDetails();
                              showSuccessSnackBar(
                                  'Usuário ataualizado com sucesso');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.teal,
                        )),
                    IconButton(
                        onPressed: () {
                          deleteFormDialog(context, userList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUser()),
          ).then((data) {
            if (data != null) {
              getAllUserDetails();
              showSuccessSnackBar('Usuário adicionado com sucesso');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

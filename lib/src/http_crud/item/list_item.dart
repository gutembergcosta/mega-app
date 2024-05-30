import 'package:flutter/material.dart';
import 'package:mega_app/models/api_response.dart';
import 'package:mega_app/models/item.dart';
import 'package:mega_app/src/http_crud/item/form_item.dart';
import 'package:mega_app/src/services/auth_service.dart';
import 'package:mega_app/src/services/item_service.dart';
import 'package:mega_app/src/services/user_service.dart';
import 'package:mega_app/models/user02.dart';
import 'package:mega_app/src/http_crud/item/view_item.dart';

class ListItem extends StatefulWidget {
  const ListItem({super.key});

  @override
  State<ListItem> createState() => ListItemState();
}

class ListItemState extends State<ListItem> {
  List<dynamic> _itemList = [];
  int userId = 0;
  bool _loading = true;

  late List<User02> userList = <User02>[];
  final userService = UserService();

  Future<void> getAllItems() async {
    userId = await getUserId();
    _loading = true;

    ApiResponse response = await listItems();

    if (response.error == null) {
      setState(() {
        _itemList = response.data as List;
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    getAllItems();
    super.initState();
  }

  showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  deleteFormDialog(BuildContext context, id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))),
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
                    var result = await deleteItem(id);
                    if (result != '') {
                      getAllItems();
                      showSuccessSnackBar('Usuário excluído com sucesso');
                    }
                    
                  },
                  child: const Text('Deletar')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightBlue.shade900),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite CRUD HTTP'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _itemList.length,
              itemBuilder: (context, index) {
                Item item = _itemList[index];
                return Card(
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewItem(item: item),
                        ),
                      );
                    },
                    leading: const Icon(Icons.person),
                    title: Text(item.nome ?? ''),
                    subtitle: Text(item.info ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormItem(item: item),
                              ),
                            ).then((data) {
                              if (data != null) {
                                getAllItems();
                                showSuccessSnackBar('Usuário ataualizado com sucesso');
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.teal,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteFormDialog(context, item.id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )
                        )
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormItem()),
          ).then((data) {
            if (data != null) {
              getAllItems();
              showSuccessSnackBar('Usuário adicionado com sucesso');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

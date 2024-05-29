import 'package:flutter/material.dart';
import 'package:mega_app/src/http_crud/item/list_item.dart';
import 'package:mega_app/src/http_crud/login_screen.dart';
import 'package:mega_app/src/services/auth_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void loadUserInfo() async {
    String userToken = await getUserToken();

    var pagina = (userToken != '') ? const ListItem() : const LoginScreen();

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => pagina), (route) => false
      );
    }
  }

  @override
  void initState() {
    loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:mega_app/models/user02.dart';
import 'package:mega_app/src/db_helper/repository.dart';

class UserService {
  late Repository repository;

  UserService() {
    repository = Repository();
  }

  addUser(User02 user) async {
    return await repository.insertData('users', user.toMap());
  }

  listUser() async {
    return await repository.listData('users');
  }
}

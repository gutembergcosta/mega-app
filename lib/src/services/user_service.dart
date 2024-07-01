import 'package:mega_app/models/user_sqlite.dart';
import 'package:mega_app/src/db_helper/repository.dart';

class UserService {
  late Repository repository;

  UserService() {
    repository = Repository();
  }

  addUser(User user) async {
    return await repository.insertData('users', user.toMap());
  }

  listUsers() async {
    return await repository.listData('users');
  }

  //Edit User
  updateUser(User user) async {
    return await repository.updateData('users', user.toMap());
  }

  deleteUser(userId) async {
    return await repository.delteById('users', userId);
  }
}

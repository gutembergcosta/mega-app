import 'package:mega_app/models/user.dart';
import 'package:mega_app/src/db_helper/repository.dart';

class UserService {
  late Repository _repository;

  UserService() {
    _repository = Repository();
  }

  addUser(User user) async {
    return await _repository.insertData('users', user.toMap());
  }
}

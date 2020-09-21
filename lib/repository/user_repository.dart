import 'package:iromikke/dao/user_dao.dart';

import 'package:iromikke/entity/user.dart';

class UserRepository {

  final UserDao _dao = UserDao();

  Future getProfile() => this._dao.getAll();

  Future updateProfile(User user) => this._dao.update(user);

}
import 'package:iromikke/dao/user_color_dao.dart';

import 'package:iromikke/entity/user_color.dart';

class UserColorRepository {

  final UserColorDao _dao = UserColorDao();

  Future getAllColors() => this._dao.getAll();

  Future updateColors(UserColor color) => this._dao.update(color);

}
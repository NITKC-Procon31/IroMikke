import 'package:iromikke/dao/color_dao.dart';

class ColorRepository {

  final ColorDao _dao = ColorDao();

  Future getAllColors() => this._dao.getAll();

}
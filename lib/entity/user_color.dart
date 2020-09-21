import 'package:scidart/numdart.dart';

class UserColor {

  int id;
  bool flag;

  UserColor({this.id, this.flag});

  factory UserColor.fromDatabaseJson(Map<String, dynamic> data) => UserColor(
    id: data['id'],
    flag: intToBool(data['flag'])
  );

  Map<String, dynamic> toDatabaseJson() => {
    'id': this.id,
    'flag': boolToInt(this.flag)
  };

}
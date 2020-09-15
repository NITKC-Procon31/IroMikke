import 'package:iromikke/utils/d_color.dart';

class TraditionalColor {

  int id;
  DColor color;
  String name, kana, hex;

  TraditionalColor({this.id, this.name, this.kana, this.hex, this.color});

  factory TraditionalColor.fromDatabaseJson(Map<String, dynamic> data) => TraditionalColor(
    id: data['id'],
    name: data['name'],
    kana: data['kana'],
    hex: data['hex'],
    color: DColor(data['red'], data['green'], data['blue'])
  );

  Map<String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "name": this.name,
    "kana": this.kana,
    "hex": this.hex,
    "red": this.color.r,
    "green": this.color.g,
    "blue": this.color.b,
  };

}
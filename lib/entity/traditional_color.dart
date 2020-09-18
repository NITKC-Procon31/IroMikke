import 'package:iromikke/utils/cmyk_color.dart';
import 'package:iromikke/utils/rgb_color.dart';

class TraditionalColor {

  int id;
  RGBColor rgb;
  CMYKColor cmyk;
  String name, kana, hex;

  TraditionalColor({this.id, this.name, this.kana, this.hex, this.rgb, this.cmyk});

  factory TraditionalColor.fromDatabaseJson(Map<String, dynamic> data) => TraditionalColor(
    id: data['id'],
    name: data['name'],
    kana: data['kana'],
    hex: data['hex'],
    rgb: RGBColor(data['red'], data['green'], data['blue']),
    cmyk: CMYKColor(data['cyan'], data['magenta'], data['yellow'], data['keyplate'])

  );

  Map<String, dynamic> toDatabaseJson() => {
    'id': this.id,
    'name': this.name,
    'kana': this.kana,
    'hex': this.hex,
    'red': this.rgb.r,
    'green': this.rgb.g,
    'blue': this.rgb.b,
    'cyan': this.cmyk.c,
    'magenta': this.cmyk.m,
    'yellow': this.cmyk.y,
    'keyplate': this.cmyk.k
  };

}
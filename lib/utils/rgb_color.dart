import 'package:delta_e/delta_e.dart';

class RGBColor {

  int _r, _g, _b;

  RGBColor(this._r, this._g, this._b);

  factory RGBColor.fromHex(String hex) => RGBColor(
    int.parse(hex.substring(1, 3), radix: 16),
    int.parse(hex.substring(3, 5), radix: 16),
    int.parse(hex.substring(5, 7), radix: 16)
  );

  int get r => _r;
  int get g => _g;
  int get b => _b;

  set r(int red) {
    this._r = red & 0xff;
  }

  set g(int green) {
    this._g = green & 0xff;
  }

  set b(int blue) {
    this.b = blue & 0xff;
  }

  List<int> getRGB() => [this._r, this._g, this._b];

  double distance(RGBColor col) {
    LabColor lab1 = LabColor.fromRGB(this._r, this._g, this._b);
    LabColor lab2 = LabColor.fromRGB(col.r, col.g, col.b);

    return deltaE00(lab1, lab2);
  }

  @override
  String toString() => 'RGB: ${this._r}, ${this._g}, ${this._b}';

}
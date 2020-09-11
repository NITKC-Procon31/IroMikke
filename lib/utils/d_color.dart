import 'package:delta_e/delta_e.dart';

class DColor {

  int _r, _g, _b;

  DColor(this._r, this._g, this._b);

  int get r => _r;
  int get g => _g;
  int get b => _b;

  set r(int red){
    this._r = red & 0xff;
  }

  set g(int green){
    this._g = green & 0xff;
  }

  set b(int blue){
    this.b = blue & 0xff;
  }

  List getRGB() => [this._r, this._g, this._b];

  double distance(DColor col){
    LabColor lab1 = LabColor.fromRGB(this._r, this._g, this._b);
    LabColor lab2 = LabColor.fromRGB(col.r, col.g, col.b);

    return deltaE00(lab1, lab2);
  }
}
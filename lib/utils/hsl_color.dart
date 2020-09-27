import 'dart:math';

import 'package:iromikke/utils/rgb_color.dart';

class HSLColor {

  int h, s, l;

  static final int RGB_MAX = 255;
  static final int HUE_MAX = 360;
  static final int SAT_MAX = 100;
  static final int LIGHT_MAX = 100;

  HSLColor({this.h, this.s, this.l});

  factory HSLColor.fromRGB(RGBColor rgb) {
    int hue, sat, lig;

    int cr = rgb.r;
    int cg = rgb.g;
    int cb = rgb.b;

    final cmax = [
      ([cr, cg].reduce(max)),
      cb
    ].reduce(max); //r,g,bの最大値

    final cmin = [
      ([cr, cg].reduce(min)),
      cb
    ].reduce(min); //r,g,bの最小値

    // Hue
    final hp = HUE_MAX / 6;
    if (cmax == cmin) {
      hue = 0;
    } else if (cr == cmax) {
      hue = (hp * ((cg - cb) / (cmax - cmin))).floor();
    } else if (cg == cmax) {
      hue = (hp * ((cb - cr) / (cmax - cmin)) + HUE_MAX / 3).floor();
    } else if (cb == cmax) {
      hue = (hp * ((cr - cg) / (cmax - cmin)) + HUE_MAX * 2 / 3).floor();
    }
    if (hue < 0) {
      hue += HUE_MAX;
    }

    // Saturation
    final cnt = (cmax + cmin) / 2;
    if (cnt < RGB_MAX / 2) {
      if (cmax + cmin <= 0) {
        sat = 0;
      } else {
        sat = ((cmax - cmin) / (cmax + cmin) * SAT_MAX).floor();
      }
    } else {
      // FIXME: RGB = (255, 255, 255)のときcmax = cminになってしまいエラーを吐く...
      sat = ((cmax - cmin) / (RGB_MAX * 2 - cmax - cmin) * SAT_MAX).floor();
    }

    // Lightness
    lig = ((cmax + cmin) / RGB_MAX / 2 * LIGHT_MAX).floor();

    return HSLColor(h: hue, s: sat, l: lig);
  }

  HSLColor operator +(HSLColor hsl) {
    HSLColor newColor = HSLColor();
    newColor.s = ((hsl.s + this.s) / 2).floor();
    newColor.l = ((hsl.l + this.l) / 2).floor();

    if (hsl.h <= this.h) {
      newColor.h = ((hsl.h + (this.h - hsl.h)) / 2).floor();
    } else {
      newColor.h = ((this.h + (hsl.h - this.h)) / 2).floor();
    }

    return newColor;
  }
  
  RGBColor toRGB() {
    int ar, ag, ab, max, min;

    int ch = this.h % HUE_MAX;
    int cs = (this.s / SAT_MAX).floor();
    int cl = (this.l / LIGHT_MAX).floor();

    if (cl < 0.5) {
      max = cl + cl * cs;
    } else {
      max = cl + (1 - cl) * cs;
    }
    min = cl - cl * cs;

    final hp = HUE_MAX / 6;
    final q = (ch / hp).floor();

    if (q <= 1) {
      ar = max;
      ag = (ch / hp).floor() * (max - min) + min;
      ab = min;
    } else if (q <= 2) {
      ar = ((hp * 2 - ch) / hp).floor() * (max - min) + min;
      ag = max;
      ab = min;
    } else if (q <= 3) {
      ar = min;
      ag = max;
      ab = ((ch - hp * 2) / hp).floor() * (max - min) + min;
    } else if (q <= 4) {
      ar = min;
      ag = ((hp * 4 - ch) / hp).floor() * (max - min) + min;
      ab = max;
    } else if (q <= 5) {
      ar = ((ch - hp * 4) / hp).floor() * (max - min) + min;
      ag = min;
      ab = max;
    } else {
      ar = max;
      ag = min;
      ab = (((HUE_MAX - ch) / hp).floor()) * (max - min) + min;
    }

    return RGBColor(ar, ag, ab);
  }

  @override
  String toString() => 'HSL: ${this.h}, ${this.s}, ${this.l}';

}

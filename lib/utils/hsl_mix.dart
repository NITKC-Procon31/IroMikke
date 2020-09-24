import 'dart:math';
import 'package:iromikke/utils/rgb_color.dart';

class HSLColor {
  int h, s, l;

  HSLColor({this.h, this.s, this.l});

  factory HSLColor.fromRGB(RGBColor rgb) {
    int hue, sat, lig;

    final RGB_MAX = 256;
    final HUE_MAX = 360;
    final SAT_MAX = 100;
    final LIGHT_MAX = 100;

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

    //Hue
    final hp = HUE_MAX / 6;
    if (cmax == cmin) {
      hue = 0;
    } else if (cr == cmax) {
      hue = (hp * ((cg - cb) / (cmax - cmin))).round();
    } else if (cg == cmax) {
      hue = (hp * ((cb - cr) / (cmax - cmin)) + HUE_MAX / 3).round();
    } else if (cb == cmax) {
      hue = (hp * ((cr - cg) / (cmax - cmin)) + HUE_MAX * 2 / 3).round();
    }
    if (hue < 0) {
      hue += HUE_MAX;
    }

    //Saturation
    final cnt = (cmax + cmin) / 2;
    if (cnt < RGB_MAX / 2) {
      if (cmax + cmin <= 0) {
        sat = 0;
      } else {
        sat = ((cmax - cmin) / (cmax + cmin) * SAT_MAX).round();
      }
    } else {
      sat = ((cmax - cmin) / (RGB_MAX * 2 - cmax - cmin) * SAT_MAX).round();
    }

    //Lightness
    lig = ((cmax + cmin) / RGB_MAX / 2 * LIGHT_MAX).round();
    return HSLColor(h: hue, s: sat, l: lig);
  }

  HSLColor operator +(HSLColor hsl) {
    HSLColor newColor = HSLColor();
    newColor.s = ((hsl.s + this.s) / 2).round();
    newColor.l = ((hsl.l + this.l) / 2).round();
    if (hsl.h <= this.h) {
      newColor.h = ((hsl.h + (this.h - hsl.h)) / 2).round();
    } else {
      newColor.h = ((this.h + (hsl.h - this.h)) / 2).round();
    }
    return newColor;
  }
  
  RGBColor hsltorgb(HSLColor hsl) {
    int ar, ag, ab, max, min;
    final RGB_MAX = 255;
    final HUE_MAX = 360;
    final SAT_MAX = 100;
    final LIGHT_MAX = 100;

    int ch = hsl.h % HUE_MAX;
    int cs = (hsl.s / SAT_MAX).round();
    int cl = (hsl.l / LIGHT_MAX).round();

    if (cl < 0.5) {
      max = cl + cl * cs;
      min = cl - cl * cs;
    } else {
      max = cl + (1 - cl) * cs;
      min = cl - cl * cs;
    }

    final hp = HUE_MAX / 6;
    final q = (ch / hp).round();
    if (q <= 1) {
      ar = max;
      ag = (ch / hp).round() * (max - min) + min;
      ab = min;
    } else if (q <= 2) {
      ar = ((hp * 2 - ch) / hp).round() * (max - min) + min;
      ag = max;
      ab = min;
    } else if (q <= 3) {
      ar = min;
      ag = max;
      ab = ((ch - hp * 2) / hp).round() * (max - min) + min;
    } else if (q <= 4) {
      ar = min;
      ag = ((hp * 4 - ch) / hp).round() * (max - min) + min;
      ab = max;
    } else if (q <= 5) {
      ar = ((ch - hp * 4) / hp).round() * (max - min) + min;
      ag = min;
      ab = max;
    } else {
      ar = max;
      ag = min;
      ab = (((HUE_MAX - ch) / hp).round()) * (max - min) + min;
    }
    return RGBColor(ar, ag, ab);
  }

}

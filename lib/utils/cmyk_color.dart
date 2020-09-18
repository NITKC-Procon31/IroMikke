class CMYKColor {

  int c, m, y, k;

  CMYKColor(this.c, this.m, this.y, this.k);

  List getCMYK() => [this.c, this.m, this.y, this.k];

  @override
  String toString() => 'CMYK: ${this.c}, ${this.m}, ${this.y}, ${this.k}';

}
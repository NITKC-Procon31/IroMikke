import 'dart:math';

class Cryptographer {

  static String encode(String str) {
    String newStr = '';
    for (int i = 0; i < str.length; i++) {
      newStr += Random().nextInt(10).toString()
            + new String.fromCharCode(str[i].codeUnits.first + 10)
            + Random().nextInt(10).toString();
    }

    return newStr;
  }

  static String decode(String str) {
    String newStr = '';
    for (int i = 1; i < str.length; i += 3) {
      newStr += new String.fromCharCode(str[i].codeUnits.first - 10);
    }

    return newStr;
  }

}
import 'package:iromikke/network/api/endpoint/endpoint.dart';

class ApiUriStringBuilder {

  static final BASE_URL = 'http://yukana.xyz';

  static String build(EndPoint endpoint) {
    return BASE_URL + endpoint.uri;
  }

}
import 'package:iromikke/network/api/endpoint.dart';
import 'package:iromikke/network/api/method.dart';

class Information implements EndPoint {

  String get uri => '/tool/information';

  Method get method => Method.GET;

  String get json => '{}';

}
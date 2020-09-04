import 'package:iromikke/network/api/EndPoint.dart';
import 'package:iromikke/network/api/Method.dart';

class Information implements EndPoint {

  String get uri => '/tool/information';

  Method get method => Method.GET;

  String get json => '{}';

}
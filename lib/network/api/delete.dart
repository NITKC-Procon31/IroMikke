import 'package:iromikke/network/api/endpoint.dart';
import 'package:iromikke/network/api/method.dart';

class Delete implements EndPoint {

  String get uri => '/tool/delete';

  Method get method => Method.POST;

  // TODO : 実装
  String get json => '{}';

}
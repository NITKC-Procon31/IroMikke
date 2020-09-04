import 'package:iromikke/network/api/EndPoint.dart';
import 'package:iromikke/network/api/Method.dart';

class Delete implements EndPoint {

  String get uri => '/tool/delete';

  Method get method => Method.POST;

  // TODO : 実装
  String get json => '{}';

}
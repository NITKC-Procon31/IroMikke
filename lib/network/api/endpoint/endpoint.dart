import 'package:iromikke/network/api/endpoint/method.dart';

class EndPoint {

  String _uri;
  Method _method;
  String _json;

  String get uri => this._uri;

  Method get method => this._method;

  String get json => this._json;

}
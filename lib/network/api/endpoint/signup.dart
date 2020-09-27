import 'dart:convert';

import 'package:iromikke/network/api/endpoint/endpoint.dart';
import 'package:iromikke/network/api/endpoint/method.dart';

class SignUp implements EndPoint {

  int _viewerId;
  int _userId;
  String _name;

  SignUp({int viewerId, int userId, String name}) {
    this._viewerId = viewerId;
    this._userId = userId;
    this._name = name;
  }

  String get uri => '/tool/signup';

  Method get method => Method.POST;

  int get viewerId => this._viewerId;
  int get userId => this._userId;
  String get name => this._name;

  set viewerId(int id) {
    this._viewerId = id;
  }

  set userId(int id) {
    this._userId = id;
  }

  set name(String name) {
    this._name = name;
  }

  String get json {
    var list = {
      'viewer_id' : this.viewerId,
      'user_id' : this.userId,
      'name' : this.name
    };

    return jsonEncode(list);
  }

}
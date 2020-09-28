import 'dart:math';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:iromikke/model/user_model.dart';

import 'package:iromikke/network/api/api_url_string_builder.dart';
import 'package:iromikke/network/api/data_headers.dart';
import 'package:iromikke/network/api/http_headers.dart';

import 'package:iromikke/network/api/endpoint/endpoint.dart';
import 'package:iromikke/network/api/endpoint/signup.dart';

class ApiClient {

  Future<Map> run(EndPoint endpoint, HttpHeaders headers) async {
    String url = ApiUriStringBuilder.build(endpoint);
    Response response = await post(url, headers: headers.map, body: endpoint.json);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load post (${response.statusCode}');
    }
  }

  Future<void> registerUser(String name, UserModel model) async {
    int viewerId = 100000000 + Random().nextInt(900000000);
    int userId = 100000000 + Random().nextInt(900000000);
    SignUp endpoint = SignUp(viewerId: viewerId, userId: userId, name: name);
    HttpHeaders headers = HttpHeaders(viewerId, userId);

    Map mp = await this.run(endpoint, headers);
    DataHeaders dataHeaders = DataHeaders.fromMap(mp['data_headers']);
    model.userId = dataHeaders.userId;
    model.viewerId = dataHeaders.viewerId;
    model.name = name;
  }

}
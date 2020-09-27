import 'package:iromikke/network/api/cryptographer.dart';

class HttpHeaders {

  int _viewerId, _userId;

  HttpHeaders(this._viewerId, this._userId);

  Map<String, String> get map =>
      {
        'Content-Type': 'application/json',
        'USER-ID': Cryptographer.encode(this._viewerId.toString() + '+' + this._userId.toString())
      };

}
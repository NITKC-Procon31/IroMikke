class DataHeaders {

  int _viewerId, _userId, _timeStamp, _resultCode;

  DataHeaders({int viewerId, int userId, int timeStamp, int resultCode}){
    this._viewerId = viewerId;
    this._userId = userId;
    this._timeStamp = timeStamp;
    this._resultCode = resultCode;
  }

  factory DataHeaders.fromMap(Map mp) => DataHeaders(
    viewerId: mp['viewer_id'],
    userId: mp['user_id'],
    timeStamp: mp['time_stamp'],
    resultCode: mp['result_code']
  );

  int get viewerId => this._viewerId;
  int get userId => this._userId;
  int get timeStamp => this._timeStamp;
  int get resultCode => this._resultCode;

}
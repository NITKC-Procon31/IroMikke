class UserColor {

  int id;
  bool flag;

  UserColor({this.id, this.flag});

  factory UserColor.fromDatabaseJson(Map<String, dynamic> data) => UserColor(
    id: data['id'],
    flag: (data['flag'] == 1 ? true : false)
  );

  Map<String, dynamic> toDatabaseJson() => {
    'id': this.id,
    'flag': this.flag
  };

}
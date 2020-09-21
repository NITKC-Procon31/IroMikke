class User {

  String name;
  int userId, viewerId;

  User({this.name, this.userId, this.viewerId});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
    name: data['name'],
    userId: data['user_id'],
    viewerId: data['viewer_id']
  );

  Map<String, dynamic> toDatabaseJson() => {
    'name': this.name,
    'user_id': this.userId,
    'viewer_id': this.userId
  };

}
class User {

  String name;
  int id, userId, viewerId, highScore, uiColor;

  User({this.id, this.name, this.userId, this.viewerId, this.highScore, this.uiColor});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
    id: data['id'],
    name: data['name'],
    userId: data['user_id'],
    viewerId: data['viewer_id'],
    highScore: data['high_score'],
    uiColor: data['ui_color']
  );

  Map<String, dynamic> toDatabaseJson() => {
    'id': this.id,
    'name': this.name,
    'user_id': this.userId,
    'viewer_id': this.userId,
    'high_score': this.highScore,
    'ui_color': this.uiColor
  };

}
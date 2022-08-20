class User {
  final String name;
  final String? pic;

  const User({
    required this.name,
    required this.pic,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['first_name'], pic: json['avatar']);
  }
}

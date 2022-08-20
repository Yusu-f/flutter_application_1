class Developer {
  final String name;
  final String role;
  final String? pic;

  const Developer({
    required this.name,
    required this.role,
    required this.pic,
  });

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      name: json['login'],
      role: json['type'],
      pic: json['avatar_url']
    );
  }
}
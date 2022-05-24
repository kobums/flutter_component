class Jwt {
  final String code;
  final User user;

  const Jwt({required this.code, required this.user});

  factory Jwt.fromJson(Map<String, dynamic> json) {
    User user = User.fromJson(json['user']);
    return Jwt(code: json['code'] as String, user: user);
  }

  Map<String, dynamic> toJson() => {'code': code, 'user': user};
}

class User {
  final int id;
  final String email;
  final String passwd;

  const User({required this.id, required this.email, required this.passwd});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        email: json['email'] as String,
        passwd: json['passwd'] as String);
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../config/config.dart' as config;

class User {
  final int id;
  final String email;
  final String firstname;
  final String lastname;

  const User(
      {required this.id,
      required this.email,
      required this.firstname,
      required this.lastname});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        email: json['email'] as String,
        firstname: json['firstname'] as String,
        lastname: json['lastname'] as String);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'email': email, 'firstname': firstname, 'lastname': lastname};
}

class UserManager {
  static Future<List<User>> find(
      {int page = 0, int pagesize = 20, String? params}) async {
    try {
      var url = '${config.serverUrl}/api/user?page=$page&pagesize=$pagesize';
      if (params != null) {
        url += '&$params';
      }
      var result = await http.get(Uri.parse(url));
      if (result.statusCode == 200) {
        final parsed = json.decode(result.body);
        return parsed['items']
            .map<User>((json) => User.fromJson(json))
            .toList();
      }
    } catch (e) {
      ///print(e);
    }

    return List<User>.empty(growable: true);
  }

  insert(User item) async {
    try {
      var result = await http.post(Uri.parse('${config.serverUrl}/api/user'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(item));
      if (result.statusCode == 200) {
        final parsed = json.decode(result.body);

        log(parsed);
      }
    } catch (e) {
      //print(e);
    }
  }
}

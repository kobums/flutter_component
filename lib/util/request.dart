import 'dart:io';
import 'package:http/http.dart' as http;

class Request {
  Future<String?> login(url, username, password, token) async {
    var res = await http.post(
      url,
      body: {"username": username, "password": password},
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return null;
    }
  }
}

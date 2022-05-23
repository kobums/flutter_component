import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../config/config.dart' as config;

class Picture {
  final int id;
  final String title;

  const Picture({required this.id, required this.title});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(id: json['id'] as int, title: json['title'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}

class PictureManager {
  static Future<List<Picture>> find(
      {int page = 0, int pagesize = 20, String? params}) async {
    try {
      var result = await http.get(Uri.parse(
          '${config.artUrl}/api/picture?page=$page&pagesize=$pagesize'));
      if (result.statusCode == 200) {
        final parsed = json.decode(result.body);
        return parsed['items']
            .map<Picture>((json) => Picture.fromJson(json))
            .toList();
      }
    } catch (e) {
      //print(e);
    }
    return List<Picture>.empty(growable: true);
  }

  insert(Picture item) async {
    try {
      var result = await http.post(Uri.parse('${config.artUrl}/api/picture'),
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

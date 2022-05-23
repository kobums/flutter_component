import 'package:http/http.dart' as http;

class Request {
  Future<String?> login(
      {required String url,
      required String loginid,
      required String passwd}) async {
    var res = await http.post(
      Uri.parse(url),
      body: {"loginid": loginid, "passwd": passwd},
      // headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return null;
    }
  }
}

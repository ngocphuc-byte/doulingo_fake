import 'package:http/http.dart' as http;

class LoginRepository {
  Future<String> getUser() async {
    String url = 'http://10.0.2.2:3000/api/login/get';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: {'username': 'abcd'},
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return 'abc'; //Model.fromJSON(json.decode(response.body))
    }
  }
}

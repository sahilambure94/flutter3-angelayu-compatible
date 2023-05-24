import 'package:http/http.dart' as http;
import 'dart:convert';

class MyNetwork {
  final String url;
  MyNetwork(this.url);
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    String data = response.body;
    var decodeData = jsonDecode(data);
    return decodeData;
  }
}

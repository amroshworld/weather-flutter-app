import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.u});
  String u ;
  Future url() async {
    http.Response response = await http.get(u);
    var data = response.body;
    if (response.statusCode == 200) {
      var decodeData =  jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}

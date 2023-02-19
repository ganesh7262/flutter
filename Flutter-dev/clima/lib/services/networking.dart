import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});

  String url;
  var dataFromRes;

  Future GetData() async {
    http.Response data = await http.get(
      Uri.parse(url),
    );
    if (data.statusCode == 200) {
      dataFromRes = jsonDecode(
        data.body.toString(),
      );
      return dataFromRes;
    } else {
      print(data.statusCode);
    }
  }
}

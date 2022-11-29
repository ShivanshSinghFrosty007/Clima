import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final Uri uri;

  NetworkHelper({required this.uri});

  Future getData() async {
    Response response = await get(uri);
    return jsonDecode(response.body);
  }
}

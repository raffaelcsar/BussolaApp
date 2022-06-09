import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() {
  var url = "https://api.spotify.com/v1/shows/1aaM6oIWCaIJJ2l0YQVSgl";

  final client = HttpClient();
  //request
  final request = client.openUrl('get', Uri.parse(url));
  //response
}

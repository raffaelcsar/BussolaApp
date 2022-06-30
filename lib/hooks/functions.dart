import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  fetch();
}

Map<String, String> get headers => {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":
          "Bearer BQCjwEiMXU1pqQLqxEMHbyrnzN2FpMQJ63XQt0vDd6sQg9oLvbTGHXKGz4wf34obgTts7d0U5LbZ8_qH6uD5dyyM-vzS2wrmY6Nal7mvtwAyZf3ik4vh7kcWMjWhyrvOEh-lzp7yLvsH4yi7juoDHsU3dXlkNVFHy5TX2qfAzgXeIq7isNw"
    };

Future fetch() async {
  var url = "https://api.spotify.com/v1/shows/1aaM6oIWCaIJJ2l0YQVSgl/episodes";
  var response = await http.get(Uri.parse(url), headers: headers);
  final responseJson = jsonDecode(response.body);
  print(responseJson['items']);
}

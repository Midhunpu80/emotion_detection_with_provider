// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

List<dynamic> lam = [];

postimage(String urs) async {
  var head = {
    'content-type': 'application/json',
    'X-RapidAPI-Key': 'ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44',
    'X-RapidAPI-Host': 'emotion-detection2.p.rapidapi.com'
  };

  String url = "https://emotion-detection2.p.rapidapi.com/emotion-detection";
  dynamic bdy = {"url": urs};

  final response =
      await http.post(Uri.parse(url), headers: head, body: jsonEncode(bdy));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    print("the data recived");
    print(
        "---------------------is recived  the data ${data.toString()}-------------------------------");
    lam = List<String>.from(data.map((entry) => entry['emotion']['value']));

    print(lam);
  } else {
    print("is not working ${response.body}");
  }
}

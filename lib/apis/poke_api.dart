import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

var url =
    "https://raw.githubusercontent.com/hungps/flutter_pokedex/master/assets/pokemons.json";

getApi() async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    log("Connection established ");
    var result = jsonDecode(response.body.toString());
    return result;
  }
}

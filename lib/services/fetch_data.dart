import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/5/'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokemon');
  }
}

class Pokemon {
  final String name;
  final int height;
  final int weight;
  final String? image;

  const Pokemon({
    required this.name,
    required this.height,
    required this.weight,
    this.image,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      image: json['image'] ?? 'https://cataas.com/cat',
    );
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({required this.name, required this.imageUrl});
}

class PokemonService {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];

      List<Pokemon> pokemons = [];

      for (var item in results) {
        final detailResponse = await http.get(Uri.parse(item['url']));
        if (detailResponse.statusCode == 200) {
          final detailData = json.decode(detailResponse.body);
          final name = item['name'];
          final image = detailData['sprites']['front_default'];
          pokemons.add(Pokemon(name: name, imageUrl: image));
        }
      }

      return pokemons;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}

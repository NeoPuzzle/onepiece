import 'package:onepiece/src/model/character.model.dart';
import 'package:http/http.dart' as http;
import 'package:onepiece/src/model/fruit.model.dart';

class ApiService {
  final String baseUrl = 'https://api.api-onepiece.com/v2';
  

  Future<List<OnePieceCharacter >> fetchCharacters() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters/en'));
      // print(response.body);

      if (response.statusCode == 200) {
        return charactersFromJson(response.body);
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw  Exception('Error: $e');
    }
  }

  Future<List<Fruits>> fetchFruits() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/fruits/en'));
      // print(response.body);

      if (response.statusCode == 200) {
        return fruitsFromJson(response.body);
      }else {
        throw Exception('Failed to load Fruits');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<OnePieceCharacter>> fetchCharacterByName(String name) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters/en/search/?name=$name'));

      if (response.statusCode == 200) {
        return charactersFromJson(response.body);
      } else {
        throw Exception('Failed to load character');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
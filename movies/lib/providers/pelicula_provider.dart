import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/models/pelicula.dart';

class PeliculaProvider {
  Future<List<Pelicula>> buscarPeliculas(String query) async {
    try {
      const apiKey = 'a9a1b302';
      const baseUrl = 'https://www.omdbapi.com';
      final response =
          await http.get(Uri.parse('$baseUrl?apikey=$apiKey&s=$query'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          final peliculaList = (data['Search'] as List)
              .map((item) => Pelicula(
                  title: item['Title'],
                  year: item['Year'],
                  poster: item['Poster']))
              .toList();
          return peliculaList;
        } else {
          throw Exception('Error en la API');
        }
      } else {
        throw Exception('Error en la API');
      }
    } catch (error) {
      throw Exception('Error en la API: $error');
    }
  }
}

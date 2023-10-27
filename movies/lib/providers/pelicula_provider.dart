import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/models/pelicula.dart';
import 'package:movies/models/pelicula_detalle.dart';

class PeliculaProvider {
  final apiKey = 'a9a1b302';
  final baseUrl = 'https://www.omdbapi.com';

  Future<List<Pelicula>> buscarPeliculas(String query) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl?apikey=$apiKey&s=$query'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          final peliculaList = (data['Search'] as List)
              .map((item) => Pelicula(
                  title: item['Title'],
                  year: item['Year'],
                  poster: item['Poster'],
                  imdbID: item['imdbID']))
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

  Future<PeliculaDetalle> detallePelicula(String imdbID) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl?apikey=$apiKey&i=$imdbID'));

      if (response.statusCode == 200) {
        final detalle = json.decode(response.body);
        if (detalle['Response'] == 'True') {
          final peliculaDetalle = PeliculaDetalle(
            title: detalle['Title'],
            year: detalle['Year'],
            poster: detalle['Poster'],
            genre: detalle['Genre'],
            director: detalle['Director'],
            actors: detalle['Actors'],
          );
          return peliculaDetalle;
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

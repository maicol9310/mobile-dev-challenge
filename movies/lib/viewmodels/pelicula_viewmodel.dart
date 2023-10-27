import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movies/models/pelicula.dart';

class MovieViewModel with ChangeNotifier {
  static const apiKey = 'a9a1b302';
  static const baseUrl = 'https://www.omdbapi.com';

  List<Pelicula> _peliculas = [];

  List<Pelicula> get mpeliculas => _peliculas;

  Future<void> buscarPeliculas(String query) async {
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
        _peliculas = peliculaList;
        notifyListeners();
      }
    } else {
      throw Exception('Error en la API');
    }
  }
}

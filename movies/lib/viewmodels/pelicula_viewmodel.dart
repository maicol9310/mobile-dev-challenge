import 'package:flutter/material.dart';
import 'package:movies/models/pelicula.dart';
import 'package:movies/providers/pelicula_provider.dart';

class PeliculaViewModel with ChangeNotifier {
  List<Pelicula> _peliculas = [];
  List<Pelicula> get peliculas => _peliculas;

  final PeliculaProvider _provider = PeliculaProvider();

  Future<void> buscarPeliculas(String query) async {
    try {
      final peliculaList = await _provider.buscarPeliculas(query);
      _peliculas = peliculaList;
      notifyListeners();
    } catch (error) {
      throw Exception('Error en la API: $error');
    }
  }
}

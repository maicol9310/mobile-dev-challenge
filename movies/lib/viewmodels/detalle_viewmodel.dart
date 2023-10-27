import 'package:flutter/material.dart';
import 'package:movies/models/pelicula_detalle.dart';
import 'package:movies/providers/pelicula_provider.dart';

class PeliculaDetalleViewModel with ChangeNotifier {
  PeliculaDetalle _detalle = PeliculaDetalle(
      title: '', year: '', poster: '', genre: '', director: '', actors: '');
  PeliculaDetalle get detalles => _detalle;

  final PeliculaProvider _provider = PeliculaProvider();

  Future<void> detallePelicula(String imdbID) async {
    try {
      final detalle = await _provider.detallePelicula(imdbID);
      _detalle = detalle;
      notifyListeners();
    } catch (error) {
      throw Exception('Error en la API: $error');
    }
  }
}

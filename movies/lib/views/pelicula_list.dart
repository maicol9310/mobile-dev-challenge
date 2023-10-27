import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies/viewmodels/pelicula_viewmodel.dart';

class PeliculaList extends StatelessWidget {
  const PeliculaList({super.key});

  @override
  Widget build(BuildContext context) {
    final peliculaViewModel = Provider.of<PeliculaViewModel>(context);
    final peliculas = peliculaViewModel.peliculas;
    TextEditingController peliculasQueryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mundo Peliculas'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller:
                  peliculasQueryController, // Asigna el controlador al campo de texto
              decoration: const InputDecoration(labelText: 'Película:'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final query =
                  peliculasQueryController.text; // Obtiene el valor ingresado
              peliculaViewModel.buscarPeliculas(
                  query); // Realiza la búsqueda al presionar el botón
            },
            child: const Text('Buscar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: peliculas.length,
              itemBuilder: (context, index) {
                final pelicula = peliculas[index];
                return ListTile(
                  title: Text(pelicula.title),
                  subtitle: Text(pelicula.year),
                  leading: Image.network(pelicula.poster),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

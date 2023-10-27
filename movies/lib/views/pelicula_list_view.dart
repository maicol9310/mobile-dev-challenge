import 'package:flutter/material.dart';
import 'package:movies/views/pelicula_detalle_view.dart';
import 'package:provider/provider.dart';
import 'package:movies/viewmodels/pelicula_viewmodel.dart';

class PeliculaListScreen extends StatelessWidget {
  const PeliculaListScreen({Key? key});

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
              controller: peliculasQueryController,
              decoration: const InputDecoration(labelText: 'Película:'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final query = peliculasQueryController.text;
              peliculaViewModel.buscarPeliculas(query);
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
                  onTap: () {
                    // Navega a la vista de detalle con el imdbID
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PeliculaDetalleScreen(
                          imdbID: pelicula
                              .imdbID, // Pasa el imdbID a la vista de detalle
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

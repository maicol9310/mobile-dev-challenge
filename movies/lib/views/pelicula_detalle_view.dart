import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies/viewmodels/detalle_viewmodel.dart';

class PeliculaDetalleScreen extends StatelessWidget {
  final String imdbID;
  const PeliculaDetalleScreen({required this.imdbID});

  bool isImageURL(String url) {
    final fileExtension = url.split('.').last.toLowerCase();
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    return imageExtensions.contains(fileExtension);
  }

  @override
  Widget build(BuildContext context) {
    final peliculaDetalleViewModel =
        Provider.of<PeliculaDetalleViewModel>(context);

    peliculaDetalleViewModel.detallePelicula(imdbID);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Película'),
      ),
      body: Center(
        child: Consumer<PeliculaDetalleViewModel>(
          builder: (context, viewModel, child) {
            // ignore: unnecessary_null_comparison
            if (viewModel.detalles != null) {
              final detalle = viewModel.detalles;
              if (isImageURL(detalle.poster)) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 300,
                      child: Image.network(
                        detalle.poster,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text('Título: ${detalle.title}'),
                    Text('Año: ${detalle.year}'),
                    Text('Género: ${detalle.genre}'),
                    Text('Director: ${detalle.director}'),
                    Text('Actores: ${detalle.actors}'),
                  ],
                );
              } else {
                return const Text('La URL de la imagen no es válida');
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

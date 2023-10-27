import 'package:flutter/material.dart';
import 'package:movies/viewmodels/detalle_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:movies/views/pelicula_list_view.dart';
import 'package:movies/viewmodels/pelicula_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PeliculaViewModel()),
        ChangeNotifierProvider(create: (context) => PeliculaDetalleViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PeliculaListScreen(),
      ),
    );
  }
}

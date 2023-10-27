import 'package:flutter/material.dart';
import 'package:movies/views/pelicula_list.dart';
import 'package:provider/provider.dart';
import 'package:movies/viewmodels/pelicula_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PeliculaViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PeliculaList(),
      ),
    );
  }
}

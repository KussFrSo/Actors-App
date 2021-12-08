import 'package:actors/src/pantalles/detalls_actor.dart';
import 'package:actors/src/pantalles/detalls_pelicula.dart';
import 'package:actors/src/pantalles/pantalla_inicial.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actors TMDB',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MoviesPages(),
        '/second': (BuildContext context) => ActorDetalls(),
        '/third': (BuildContext context) => PeliculaDetalls()
      },
    );
  }
}

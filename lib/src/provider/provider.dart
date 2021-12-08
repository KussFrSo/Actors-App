import 'dart:async';
import 'dart:convert';
import 'package:actors/src/info/info_actor.dart';
import 'package:actors/src/info/info_peli.dart';
import 'package:http/http.dart' as http;
import 'package:actors/src/info/info_peli_actor.dart';

class Provider {
  String _apikey = '42fd54ff3aa4ee4d8571806b9dbdfb70';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  bool _cargando = false;
  int _popularesPage = 0;

  List<Actor> _populares = [];

  final _popularesStreamController = StreamController<List<Actor>>.broadcast();

  Function(List<Actor>) get popularesSink =>
      _popularesStreamController.sink.add;
  Stream<List<Actor>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController.close();
  }

  Future<List<Actor>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final actor = Actors.fromJsonList(decodedData['results']);

    return actor.actores;
  }

  Future<List<Actor>> getActores() async {
    _popularesPage++;

    final url = Uri.https(_url, '3/person/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    return await _procesarRespuesta(url);
  }

  Future<List<Peli>> getCast(int idActor) async {
    final url = Uri.https(_url, '3/person/$idActor/movie_credits',
        {'api_key': _apikey, 'language': _language}); // pelicula

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = Pelis.fromJsonList(decodedData['cast']);

    return cast.pelis;
  }

  Future<PeliSelecionada> getInfoPeli(int idPelicula) async {
    final url = Uri.https(_url, '3/movie/$idPelicula',
        {'api_key': _apikey, 'language': _language}); // pelicula

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final infoPeli = PeliSelecionada.fromJsonMap(decodedData);

    return infoPeli;
  }

  Future<List<Actor>> getCastPelicula(String peliId) async {
    if (_cargando) return [];

    _cargando = true;
    _popularesPage++;

    final url = Uri.https(_url, '3/movie/$peliId/credits',
        {'api_key': _apikey, 'language': _language}); // pelicula

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = new Actors.fromJsonList(decodedData['cast']);

    _populares.addAll(cast.actores);
    popularesSink(_populares);

    _cargando = false;

    return cast.actores;
  }
}

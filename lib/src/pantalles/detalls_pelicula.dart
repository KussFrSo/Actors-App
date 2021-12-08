import 'package:actors/src/info/info_actor.dart';
import 'package:actors/src/provider/provider.dart';
import 'package:actors/src/witgets/card_actor.dart';
import 'package:actors/src/witgets/card_pelicula.dart';
import 'package:actors/src/witgets/cast_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:actors/src/info/info_peli.dart';

class PeliculaDetalls extends StatelessWidget {
  final provider = new Provider();
  @override
  Widget build(BuildContext context) {
    final idPelicula = ModalRoute.of(context).settings.arguments;
    provider.getCastPelicula(idPelicula.toString());

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _detailsPelicula(idPelicula),
            SizedBox(
              height: 20,
            ),
            _detailsCast(idPelicula),
          ],
        ),
      ),
    ));
  }

  Widget _detailsPelicula(idPeli) {
    return FutureBuilder(
      future: provider.getInfoPeli(idPeli),
      builder: (BuildContext context, AsyncSnapshot<PeliSelecionada> snapshot) {
        if (snapshot.hasData) {
          return CardPelicula(infoPeli: snapshot.data);
        } else {
          return Container(height: 50.0, child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _detailsCast(idPeli) {
    return StreamBuilder(
      stream: provider.popularesStream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CastHoritzontal(
            actores: snapshot.data,
            siguientePagina: provider.getCastPelicula,
          );
        } else {
          return Container(height: 50.0, child: CircularProgressIndicator());
        }
      },
    );
  }
}

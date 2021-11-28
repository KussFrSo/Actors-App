import 'package:actors/src/witgets/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:actors/src/provider/provider.dart';

class MoviesPages extends StatelessWidget {
  final provider = new Provider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[_swiperTarjetas()],
      ),
    ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: provider.getActores(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(actores: snapshot.data);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

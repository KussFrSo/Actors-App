import 'package:actors/src/provider/provider.dart';
import 'package:actors/src/info/info_actor.dart';
import 'package:flutter/material.dart';

import 'horitzontal_pelis.dart';

class CardActor extends StatelessWidget {
  final Actor infoActor;

  CardActor({@required this.infoActor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Expanded(
        child: Stack(
          children: [
            Positioned(
              child: Hero(
                tag: infoActor.id,
                child: FadeInImage(
                  image: NetworkImage(infoActor.getFoto()),
                  placeholder: AssetImage('assets/spinner.gif'),
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ])),
              ),
            ),
            Positioned(
              bottom: 370,
              left: 20,
              child: Text(
                "Peliculas:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 15,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  infoActor.name,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                )),
            Positioned(
              bottom: 1,
              left: 10,
              height: 370,
              width: MediaQuery.of(context).size.width,
              child: _swiperTarjetas(infoActor.id),
            ),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas(idActor) {
    final provider = new Provider();
    return FutureBuilder(
      future: provider.getCast(idActor),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return HoritzontalPeli(peliculas: snapshot.data);
        } else {
          return Container(height: 50.0, child: CircularProgressIndicator());
        }
      },
    );
  }
}

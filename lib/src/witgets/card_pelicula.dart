import 'package:actors/src/info/info_peli.dart';
import 'package:actors/src/provider/provider.dart';
import 'package:actors/src/info/info_actor.dart';
import 'package:flutter/material.dart';

import 'horitzontal_pelis.dart';

class CardPelicula extends StatelessWidget {
  PeliSelecionada infoPeli;

  CardPelicula({@required this.infoPeli});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: Hero(
                    tag: infoPeli.id,
                    child: FadeInImage(
                      image: NetworkImage(infoPeli.getPosterPeli()),
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
                            end: Alignment.center,
                            colors: [
                          Colors.grey.shade50.withOpacity(1),
                          Colors.grey.shade50.withOpacity(0),
                        ])),
                  ),
                ),
                Positioned(
                    bottom: 40,
                    left: 15,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 370),
                        child: Text(
                          infoPeli.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Data Sortida: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(infoPeli.fehcaSalida, style: TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                children: [
                  Text("Puntuacio: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    infoPeli.getPuntuacio(),
                    style: TextStyle(fontSize: 15),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Descripció",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(infoPeli.descripcio),
              ),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:actors/src/info/info_peli_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HoritzontalPeli extends StatefulWidget {
  final List<Peli> peliculas;

  HoritzontalPeli({@required this.peliculas});

  @override
  State<HoritzontalPeli> createState() => _HoritzontalPeliState();
}

class _HoritzontalPeliState extends State<HoritzontalPeli> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.5,
          itemHeight: _screenSize.height * 0.35,
          onIndexChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            widget.peliculas[index].id = widget.peliculas[index].id;

            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  child: GestureDetector(
                    child: FadeInImage(
                      image:
                          NetworkImage(widget.peliculas[index].getPosterPeli()),
                      placeholder: AssetImage('assets/spinner.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ));
          },
          itemCount: widget.peliculas.length,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.peliculas[_current].title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 148.0),
          child: Row(
            children: [
              Text("Puntuacio: "),
              Text(widget.peliculas[_current].getPuntuacio()),
              Icon(Icons.star)
            ],
          ),
        )
      ],
    );

    //   return Positioned(
    //     height: 300,
    //     width: 200,
    //     child: PageView.builder(
    //       itemCount: peliculas.length,
    //       itemBuilder: (context, i) => _tarjeta(context, peliculas[i]),
    //     ),
    //   );
    // }

    // @override
    // Widget _tarjeta(BuildContext context, Peli pelicula) {
    //   pelicula.id = pelicula.id;

    //   return Container(
    //     margin: EdgeInsets.only(right: 15.0),
    //     child: Column(
    //       children: <Widget>[
    //         FadeInImage(
    //           image: NetworkImage(pelicula.getPosterPeli()),
    //           placeholder: AssetImage('assets/spinner.gif'),
    //           fit: BoxFit.cover,
    //         ),
    //         SizedBox(height: 5.0),
    //         Text(
    //           pelicula.title,
    //           overflow: TextOverflow.ellipsis,
    //           style: Theme.of(context).textTheme.caption,
    //         )
    //       ],
    //     ),
    //   );
    // }
  }
}

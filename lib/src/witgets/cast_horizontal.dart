import 'package:actors/src/info/info_actor.dart';
import 'package:flutter/material.dart';

class CastHoritzontal extends StatelessWidget {
  final List<Actor> actores;
  final Function siguientePagina;

  CastHoritzontal({@required this.actores, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Actors",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: _screenSize.height * 0.2,
          child: PageView.builder(
            pageSnapping: false,
            controller: _pageController,
            itemCount: actores.length,
            itemBuilder: (context, i) => _tarjeta(context, actores[i]),
          ),
        ),
      ],
    );
  }

  Widget _tarjeta(BuildContext context, Actor actores) {
    actores.id = actores.id;

    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: actores.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(actores.getFoto()),
                placeholder: AssetImage('assets/spinner.gif'),
                fit: BoxFit.cover,
                height: 120.0,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            actores.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, '/second', arguments: actores);
      },
    );
  }
}

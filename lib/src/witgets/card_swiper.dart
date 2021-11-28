import 'package:actors/src/info/info_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatefulWidget {
  final List<Actor> actores;

  CardSwiper({@required this.actores});

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: widget.actores.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(widget.actores[_current].getFoto(),
                  fit: BoxFit.cover);
            },
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
            bottom: 50,
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Swiper(
              layout: SwiperLayout.STACK,
              itemWidth: _screenSize.width * 0.7,
              itemHeight: _screenSize.height * 0.5,
              onIndexChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                widget.actores[index].id = widget.actores[index].id;

                return Hero(
                  tag: widget.actores[index].id,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              '/second',
                              arguments: widget.actores[index]),
                          child: FadeInImage(
                            image:
                                NetworkImage(widget.actores[index].getFoto()),
                            placeholder: AssetImage('assets/spinner.gif'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                );
              },
              itemCount: widget.actores.length,
              // pagination: new SwiperPagination(),
              // control: new SwiperControl(),
            ),
          ),
          Positioned(
              bottom: 50,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Nom del actor: "),
                          Padding(padding: const EdgeInsets.only(left: 10.0)),
                          Text(
                            widget.actores[_current].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Popularitat: "),
                          Padding(padding: EdgeInsets.only(left: 30.0)),
                          Text(
                            widget.actores[_current].popularity,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

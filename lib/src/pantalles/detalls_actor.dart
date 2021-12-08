import 'package:actors/src/info/info_actor.dart';
import 'package:actors/src/witgets/card_actor.dart';
import 'package:flutter/material.dart';

class ActorDetalls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final infoActor = ModalRoute.of(context).settings.arguments as Actor;

    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          CardActor(
            infoActor: infoActor,
          ),
        ],
      ),
    ));
  }
}

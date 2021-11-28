class Actors {
  List<Actor> actores = [];

  Actors.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    });
  }
}

class Actor {
  int id;
  String name;
  String img;
  String popularity;

  Actor({this.id, this.name, this.img, this.popularity});

  Actor.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['profile_path'];
    popularity = json['popularity'].toString().split('.')[0];
  }

  getFoto() {
    if (img == null) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$img';
    }
  }
}

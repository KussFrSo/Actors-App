class Pelis {
  List<Peli> pelis = [];

  Pelis.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Peli.fromJsonMap(item);
      pelis.add(actor);
    });
  }
}

class Peli {
  int id;
  String title;
  String posterImg;
  String puntiation;
  String fehca_salida;

  Peli(
      {this.id,
      this.title,
      this.posterImg,
      this.puntiation,
      this.fehca_salida});

  Peli.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterImg = json['poster_path'];
    puntiation = json['vote_average'].toString();
    fehca_salida = json['release_date'];
  }

  getPosterPeli() {
    if (posterImg == null) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterImg';
    }
  }

  getPuntuacio() {
    if (puntiation == '0.0') {
      return puntiation = 'n/a';
    } else {
      return puntiation = puntiation;
    }
  }
}

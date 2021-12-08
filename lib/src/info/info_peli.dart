class PeliSelecionada {
  int id;
  String title;
  String posterImg;
  String puntiation;
  String fehcaSalida;
  String descripcio;

  PeliSelecionada(
      {this.id,
      this.title,
      this.posterImg,
      this.puntiation,
      this.fehcaSalida,
      this.descripcio});

  PeliSelecionada.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterImg = json['poster_path'];
    puntiation = json['vote_average'].toString();
    fehcaSalida = json['release_date'];
    descripcio = json['overview'];
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

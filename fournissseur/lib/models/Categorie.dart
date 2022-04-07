class Categorie {
  final  id;
  final  libelle;


  Categorie._(
      {this.id,
        this.libelle,
      });

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie._(
      id: json['id'],
      libelle: json['libelle'],

    );
  }
}
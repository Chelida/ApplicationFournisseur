class User {
 
  final int id;
  final String photo;
  final String code;
  final String firstname;
  final String lastname;
  final String email;
  final String telephone;
  final int typeclientId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String adresse;
  final int villeId;
  final int communeId;
  final int etat;
  final String statut;
  final String createdBy;
  final Commune ville;
  final Commune commune;
  final Typeclient typeclient;
 User({
     this.id,
     this.photo,
     this.code,
     this.firstname,
     this.lastname,
     this.email,
     this.telephone,
     this.typeclientId,
     this.createdAt,
     this.updatedAt,
     this.deletedAt,
     this.adresse,
     this.villeId,
     this.communeId,
     this.etat,
     this.statut,
     this.createdBy,
     this.ville,
     this.commune,
     this.typeclient,
     });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    photo: json["photo"],
    code: json["code"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    telephone: json["telephone"],
    typeclientId: json["typeclient_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    adresse: json["adresse"],
    villeId: json["ville_id"],
    communeId: json["commune_id"],
    etat: json["etat"],
    statut: json["statut"],
    createdBy: json["created_by"],
    ville: Commune.fromJson(json["ville"]),
    commune: Commune.fromJson(json["commune"]),
    typeclient: Typeclient.fromJson(json["typeclient"]),
  );


}

class Commune {
  Commune({
   this.id,
  this.villeId,
 this.name,
   this.createdAt,
  this.updatedAt,
  });

  int id;
  dynamic villeId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Commune.fromJson(Map<String, dynamic> json) => Commune(
    id: json["id"],
    villeId: json["ville_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    //"ville_id": villeId == null  null : villeId,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Typeclient {
  Typeclient({
     this.id,
     this.etat,
     this.name,
     this.createdBy,
     this.createdAt,
     this.updatedAt,
  });

  int id;
  int etat;
  String name;
  dynamic createdBy;
  DateTime createdAt;
  DateTime updatedAt;

  factory Typeclient.fromJson(Map<String, dynamic> json) => Typeclient(
    id: json["id"],
    etat: json["etat"],
    name: json["name"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
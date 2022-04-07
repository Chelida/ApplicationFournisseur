// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));


class Product {
    Product({
        this.produits,
    });

    List<Produit> produits;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        produits: List<Produit>.from(json["produits"].map((x) => Produit.fromJson(x))),
    );
}

class Produit {
    Produit({
         this.id,
        this.code,
        this.libelle,
        this.photo,
        this.dateExpiration,
        this.prixCarton,
        this.contenance,
        this.status,
        this.stockAlert,
        this.qteGrossiste,
        this.prixGrossiste,
        this.qteSemiGrossiste,
        this.prixSemiGrossiste,
        this.qteDetaillant,
        this.prixDetaillant,
        this.categorieId,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.validateBy,
        this.categorie,
    });

    int id;
    String code;
    String libelle;
    String photo;
    DateTime dateExpiration;
    int prixCarton;
    dynamic contenance;
    int status;
    int stockAlert;
    int qteGrossiste;
    int prixGrossiste;
    int qteSemiGrossiste;
    int prixSemiGrossiste;
    int qteDetaillant;
    int prixDetaillant;
    int categorieId;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String validateBy;
    Categorie categorie;

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        id: json["id"],
        code: json["code"],
        libelle: json["libelle"],
        photo: json["photo"],
        dateExpiration: DateTime.parse(json["date_expiration"]),
        prixCarton: json["prix_carton"],
        contenance: json["contenance"],
        status: json["status"],
        stockAlert: json["stock_alert"],
        qteGrossiste: json["qte_grossiste"],
        prixGrossiste: json["prix_grossiste"],
        qteSemiGrossiste: json["qte_semi_grossiste"],
        prixSemiGrossiste: json["prix_semi_grossiste"],
        qteDetaillant: json["qte_detaillant"],
        prixDetaillant: json["prix_detaillant"],
        categorieId: json["categorie_id"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        validateBy: json["validate_by"],
        categorie: Categorie.fromJson(json["categorie"]),
    );

}

class Categorie {
    Categorie({
         this.id,
         this.libelle,
         this.createdBy,
         this.createdAt,
         this.updatedAt,
        this.deletedAt,
    });

    int id;
    String libelle;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Categorie.fromJson(Map<String, dynamic> json) => Categorie(
        id: json["id"],
        libelle: json["libelle"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

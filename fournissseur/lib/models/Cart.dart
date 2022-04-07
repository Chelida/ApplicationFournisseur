// // To parse this JSON data, do
//
//     final produit = produitFromJson(jsonString);

import 'dart:convert';

Produit produitFromJson(String str) => Produit.fromJson(json.decode(str));

String produitToJson(Produit data) => json.encode(data.toJson());

class Produit {
    Produit({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool success;
    int statusCode;
    String message;
    Data data;

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.carts,
        this.montantttc,
    });

    List<Cart> carts;
    int montantttc;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
        montantttc: json["montantttc"],
    );

    Map<String, dynamic> toJson() => {
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "montantttc": montantttc,
    };
}

class Cart {
    Cart({
        this.id,
        this.quantite,
        this.montant,
        this.total,
        this.type,
        this.produitId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdBy,
        this.clientId,
        this.produitName,
        this.produitPrixUnitaire,
        this.produitPrixCarton,
        this.prixDetaillant,
        this.prixSemiGrossiste,
        this.prixGrossiste,
        this.produitPhoto,
    });

    int id;
    int quantite;
    int montant;
    int total;
    String type;
    int produitId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String createdBy;
    int clientId;
    String produitName;
    dynamic produitPrixUnitaire;
    int produitPrixCarton;
    int prixDetaillant;
    int prixSemiGrossiste;
    int prixGrossiste;
    String produitPhoto;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        quantite: json["quantite"],
        montant: json["montant"],
        total: json["total"],
        type: json["type"],
        produitId: json["produit_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        clientId: json["client_id"],
        produitName: json["produit_name"],
        produitPrixUnitaire: json["produit_prix_unitaire"],
        produitPrixCarton: json["produit_prix_carton"],
        prixDetaillant: json["prix_detaillant"],
        prixSemiGrossiste: json["prix_semi_grossiste"],
        prixGrossiste: json["prix_grossiste"],
        produitPhoto: json["produit_photo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantite": quantite,
        "montant": montant,
        "total": total,
        "type": type,
        "produit_id": produitId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "created_by": createdBy,
        "client_id": clientId,
        "produit_name": produitName,
        "produit_prix_unitaire": produitPrixUnitaire,
        "produit_prix_carton": produitPrixCarton,
        "prix_detaillant": prixDetaillant,
        "prix_semi_grossiste": prixSemiGrossiste,
        "prix_grossiste": prixGrossiste,
        "produit_photo": produitPhoto,
    };
}

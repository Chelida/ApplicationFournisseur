// To parse this JSON data, do
//
//     final commandes = commandesFromJson(jsonString);

import 'dart:convert';

Commandes commandesFromJson(String str) => Commandes.fromJson(json.decode(str));

String commandesToJson(Commandes data) => json.encode(data.toJson());

class Commandes {
    Commandes({
        this.commandes,
    });

    List<Commande> commandes;

    factory Commandes.fromJson(Map<String, dynamic> json) => Commandes(
        // commandes: List<Commande>.from(json["commandes"].map((x) => Commande.fromJson(x)),),
        commandes: json["commandes"] != null ?
                   new List<Commande>.from( json["commandes"].map((x) => Commande.fromJson(x))) : List< Commande>(),
        
    );

    Map<String, dynamic> toJson() => {
        "commandes": List<dynamic>.from(commandes.map((x) => x.toJson())),
    };
}

class Commande {
    Commande({
        this.id,
        this.reference,
        this.dateCommande,
        this.montantht,
        this.montantttc,
        this.moyenPaiement,
        this.provenance,
        this.clientId,
        this.entrepotId,
        this.createdBy,
        this.statut,
        this.etat,
        this.remarque,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.validateBy,
        this.refuseBy,
        this.entrepot,
        this.factures,
        this.produits,
    });

    int id;
    String reference;
    DateTime dateCommande;
    int montantht;
    int montantttc;
    dynamic moyenPaiement;
    String provenance;
    int clientId;
    dynamic entrepotId;
    String createdBy;
    int statut;
    int etat;
    dynamic remarque;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    dynamic validateBy;
    dynamic refuseBy;
    dynamic entrepot;
    List<dynamic> factures;
    List<Produit> produits;

    factory Commande.fromJson(Map<String, dynamic> json) => Commande(
        id: json["id"],
        reference: json["reference"],
        dateCommande: DateTime.parse(json["date_commande"]),
        montantht: json["montantht"],
        montantttc: json["montantttc"],
        moyenPaiement: json["moyen_paiement"],
        provenance: json["provenance"],
        clientId: json["client_id"],
        entrepotId: json["entrepot_id"],
        createdBy: json["created_by"],
        statut: json["statut"],
        etat: json["etat"],
        remarque: json["remarque"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        validateBy: json["validate_by"],
        refuseBy: json["refuse_by"],
        entrepot: json["entrepot"],
        factures: List<dynamic>.from(json["factures"].map((x) => x)),
        produits: List<Produit>.from(json["produits"].map((x) => Produit.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "reference": reference,
        "date_commande": dateCommande.toIso8601String(),
        "montantht": montantht,
        "montantttc": montantttc,
        "moyen_paiement": moyenPaiement,
        "provenance": provenance,
        "client_id": clientId,
        "entrepot_id": entrepotId,
        "created_by": createdBy,
        "statut": statut,
        "etat": etat,
        "remarque": remarque,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "validate_by": validateBy,
        "refuse_by": refuseBy,
        "entrepot": entrepot,
        "factures": List<dynamic>.from(factures.map((x) => x)),
        "produits": List<dynamic>.from(produits.map((x) => x.toJson())),
    };
}

class Produit {
    Produit({
        this.id,
        this.code,
        this.libelle,
        this.photo,
        this.quantite,
        this.prixUnitaire,
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
        this.pivot,
    });

    int id;
    String code;
    String libelle;
    String photo;
    int quantite;
    dynamic prixUnitaire;
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
    Pivot pivot;

    factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        id: json["id"],
        code: json["code"],
        libelle: json["libelle"],
        photo: json["photo"],
        quantite: json["quantite"],
        prixUnitaire: json["prix_unitaire"],
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
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "libelle": libelle,
        "photo": photo,
        "quantite": quantite,
        "prix_unitaire": prixUnitaire,
        "date_expiration": "${dateExpiration.year.toString().padLeft(4, '0')}-${dateExpiration.month.toString().padLeft(2, '0')}-${dateExpiration.day.toString().padLeft(2, '0')}",
        "prix_carton": prixCarton,
        "contenance": contenance,
        "status": status,
        "stock_alert": stockAlert,
        "qte_grossiste": qteGrossiste,
        "prix_grossiste": prixGrossiste,
        "qte_semi_grossiste": qteSemiGrossiste,
        "prix_semi_grossiste": prixSemiGrossiste,
        "qte_detaillant": qteDetaillant,
        "prix_detaillant": prixDetaillant,
        "categorie_id": categorieId,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "validate_by": validateBy,
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    Pivot({
        this.commandeId,
        this.produitId,
    });

    int commandeId;
    int produitId;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        commandeId: json["commande_id"],
        produitId: json["produit_id"],
    );

    Map<String, dynamic> toJson() => {
        "commande_id": commandeId,
        "produit_id": produitId,
    };
}

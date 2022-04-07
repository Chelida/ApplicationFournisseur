// To parse this JSON data, do
//
//     final versement = versementFromJson(jsonString);

import 'dart:convert';

Versement versementFromJson(String str) => Versement.fromJson(json.decode(str));

String versementToJson(Versement data) => json.encode(data.toJson());

class Versement {
    Versement({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool success;
    int statusCode;
    String message;
    Data data;

    factory Versement.fromJson(Map<String, dynamic> json) => Versement(
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
        this.livraisons,
    });

    List<LivraisonElement> livraisons;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        livraisons: List<LivraisonElement>.from(json["livraisons"].map((x) => LivraisonElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "livraisons": List<dynamic>.from(livraisons.map((x) => x.toJson())),
    };
}

class LivraisonElement {
    LivraisonElement({
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
        this.livraison,
        this.transaction,
    });

    int id;
    String reference;
    DateTime dateCommande;
    int montantht;
    int montantttc;
    dynamic moyenPaiement;
    String provenance;
    int clientId;
    int entrepotId;
    String createdBy;
    int statut;
    int etat;
    dynamic remarque;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    String validateBy;
    dynamic refuseBy;
    Entrepot entrepot;
    List<Facture> factures;
    List<Produit> produits;
    LivraisonLivraison livraison;
    dynamic transaction;

    factory LivraisonElement.fromJson(Map<String, dynamic> json) => LivraisonElement(
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
        entrepot: Entrepot.fromJson(json["entrepot"]),
        factures: List<Facture>.from(json["factures"].map((x) => Facture.fromJson(x))),
        produits: List<Produit>.from(json["produits"].map((x) => Produit.fromJson(x))),
        livraison: LivraisonLivraison.fromJson(json["livraison"]),
        transaction: json["transaction"],
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
        "entrepot": entrepot.toJson(),
        "factures": List<dynamic>.from(factures.map((x) => x.toJson())),
        "produits": List<dynamic>.from(produits.map((x) => x.toJson())),
        "livraison": livraison.toJson(),
        "transaction": transaction,
    };
}

class Entrepot {
    Entrepot({
        this.id,
        this.libelle,
        this.adresse,
        this.typeentrepotId,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    String libelle;
    String adresse;
    int typeentrepotId;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Entrepot.fromJson(Map<String, dynamic> json) => Entrepot(
        id: json["id"],
        libelle: json["libelle"],
        adresse: json["adresse"],
        typeentrepotId: json["typeentrepot_id"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "libelle": libelle,
        "adresse": adresse,
        "typeentrepot_id": typeentrepotId,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Facture {
    Facture({
        this.id,
        this.reference,
        this.montantttc,
        this.montantht,
        this.avance,
        this.reste,
        this.reduction,
        this.type,
        this.commandeId,
        this.statut,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    String reference;
    int montantttc;
    int montantht;
    int avance;
    int reste;
    int reduction;
    String type;
    int commandeId;
    int statut;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Facture.fromJson(Map<String, dynamic> json) => Facture(
        id: json["id"],
        reference: json["reference"],
        montantttc: json["montantttc"],
        montantht: json["montantht"],
        avance: json["avance"],
        reste: json["reste"],
        reduction: json["reduction"],
        type: json["type"],
        commandeId: json["commande_id"],
        statut: json["statut"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "reference": reference,
        "montantttc": montantttc,
        "montantht": montantht,
        "avance": avance,
        "reste": reste,
        "reduction": reduction,
        "type": type,
        "commande_id": commandeId,
        "statut": statut,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class LivraisonLivraison {
    LivraisonLivraison({
        this.id,
        this.dateLivraison,
        this.statut,
        this.reference,
        this.commandeId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    DateTime dateLivraison;
    int statut;
    String reference;
    int commandeId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory LivraisonLivraison.fromJson(Map<String, dynamic> json) => LivraisonLivraison(
        id: json["id"],
        dateLivraison: DateTime.parse(json["date_livraison"]),
        statut: json["statut"],
        reference: json["reference"],
        commandeId: json["commande_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_livraison": dateLivraison.toIso8601String(),
        "statut": statut,
        "reference": reference,
        "commande_id": commandeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
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
        this.type,
        this.montantTotal,
        this.prixUnitaire,
        this.quantite,
    });

    int commandeId;
    int produitId;
    dynamic type;
    int montantTotal;
    int prixUnitaire;
    int quantite;

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        commandeId: json["commande_id"],
        produitId: json["produit_id"],
        type: json["type"],
        montantTotal: json["montant_total"],
        prixUnitaire: json["prix_unitaire"],
        quantite: json["quantite"],
    );

    Map<String, dynamic> toJson() => {
        "commande_id": commandeId,
        "produit_id": produitId,
        "type": type,
        "montant_total": montantTotal,
        "prix_unitaire": prixUnitaire,
        "quantite": quantite,
    };
}

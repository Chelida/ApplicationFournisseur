
import 'dart:convert';



class Data {
    Data({
        this.factures,
    });

    List<Facture> factures;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        factures: List<Facture>.from(json["factures"].map((x) => Facture.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "factures": List<dynamic>.from(factures.map((x) => x.toJson())),
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

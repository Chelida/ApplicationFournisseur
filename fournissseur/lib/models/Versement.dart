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
        this.versements,
        this.totaldebit,
        this.totalcredit,
    });

    List<VersementElement> versements;
    int totaldebit;
    int totalcredit;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        versements: List<VersementElement>.from(json["versements"].map((x) => VersementElement.fromJson(x))),
        totaldebit: json["totaldebit"],
        totalcredit: json["totalcredit"],
    );

    Map<String, dynamic> toJson() => {
        "versements": List<dynamic>.from(versements.map((x) => x.toJson())),
        "totaldebit": totaldebit,
        "totalcredit": totalcredit,
    };
}

class VersementElement {
    VersementElement({
        this.id,
        this.numero,
        this.montant,
        this.solde,
        this.type,
        this.description,
        this.moyen,
        this.numeroCheque,
        this.numeroTelephone,
        this.dateTransaction,
        this.createdBy,
        this.compteId,
        this.commandeId,
        this.factureId,
        this.typePaiementFacture,
        this.avance,
        this.reste,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.depenseId,
        this.validateBy,
        this.validate,
    });

    int id;
    String numero;
    int montant;
    int solde;
    String type;
    String description;
    String moyen;
    String numeroCheque;
    String numeroTelephone;
    DateTime dateTransaction;
    String createdBy;
    int compteId;
    int commandeId;
    int factureId;
    String typePaiementFacture;
    int avance;
    int reste;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    dynamic depenseId;
    dynamic validateBy;
    int validate;

    factory VersementElement.fromJson(Map<String, dynamic> json) => VersementElement(
        id: json["id"],
        numero: json["numero"],
        montant: json["montant"],
        solde: json["solde"],
        type: json["type"],
        description: json["description"],
        moyen: json["moyen"],
        numeroCheque: json["numero_cheque"],
        numeroTelephone: json["numero_telephone"],
        dateTransaction: DateTime.parse(json["date_transaction"]),
        createdBy: json["created_by"],
        compteId: json["compte_id"],
        commandeId: json["commande_id"],
        factureId: json["facture_id"],
        typePaiementFacture: json["type_paiement_facture"],
        avance: json["avance"],
        reste: json["reste"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        depenseId: json["depense_id"],
        validateBy: json["validate_by"],
        validate: json["validate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "numero": numero,
        "montant": montant,
        "solde": solde,
        "type": type,
        "description": description,
        "moyen": moyen,
        "numero_cheque": numeroCheque,
        "numero_telephone": numeroTelephone,
        "date_transaction": dateTransaction.toIso8601String(),
        "created_by": createdBy,
        "compte_id": compteId,
        "commande_id": commandeId,
        "facture_id": factureId,
        "type_paiement_facture": typePaiementFacture,
        "avance": avance,
        "reste": reste,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "depense_id": depenseId,
        "validate_by": validateBy,
        "validate": validate,
    };
}

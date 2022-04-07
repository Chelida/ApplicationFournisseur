// To parse this JSON data, do
//
//     final notificationA = notificationAFromJson(jsonString);

import 'dart:convert';

NotificationA notificationAFromJson(String str) => NotificationA.fromJson(json.decode(str));

String notificationAToJson(NotificationA data) => json.encode(data.toJson());

class NotificationA {
    NotificationA({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool success;
    int statusCode;
    String message;
    Data data;

    factory NotificationA.fromJson(Map<String, dynamic> json) => NotificationA(
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
        this.notifications,
    });

    List<dynamic> notifications;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: List<dynamic>.from(json["notifications"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "notifications": List<dynamic>.from(notifications.map((x) => x)),
    };
}

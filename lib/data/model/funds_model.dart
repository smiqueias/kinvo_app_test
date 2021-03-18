import 'dart:convert';

FundsModel fundsModelFromJson(var str) => FundsModel.fromJson(str);

String fundsModelToJson(FundsModel data) => json.encode(data.toJson());

class FundsModel {
  FundsModel({
    required this.success,
    required this.data,
    this.error,
  });

  bool success;
  List<Datum> data;
  dynamic error;

  factory FundsModel.fromJson(Map<String, dynamic> json) => FundsModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.type,
    required this.minimumValue,
    required this.rating,
    required this.profitability,
    required this.status,
  });

  int id;
  String name;
  String type;
  int minimumValue;
  int rating;
  double profitability;
  int status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        minimumValue: json["minimumValue"],
        rating: json["rating"],
        profitability: json["profitability"].toDouble(),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "minimumValue": minimumValue,
        "rating": rating,
        "profitability": profitability,
        "status": status,
      };
}

import 'dart:convert';

PensionModel pensionModelFromJson(var str) => PensionModel.fromJson(str);

String pensionModelToJson(PensionModel data) => json.encode(data.toJson());

class PensionModel {
  PensionModel({
    required this.success,
    required this.data,
    required this.error,
  });

  bool success;
  List<Datum> data;
  dynamic error;

  factory PensionModel.fromJson(Map<String, dynamic> json) => PensionModel(
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
    required this.tax,
    required this.redemptionTerm,
    required this.profitability,
  });

  var id;
  String name;
  String type;
  var minimumValue;
  var tax;
  var redemptionTerm;
  var profitability;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        minimumValue: json["minimumValue"],
        tax: json["tax"],
        redemptionTerm: json["redemptionTerm"],
        profitability: json["profitability"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "minimumValue": minimumValue,
        "tax": tax,
        "redemptionTerm": redemptionTerm,
        "profitability": profitability,
      };
}

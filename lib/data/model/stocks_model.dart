import 'dart:convert';

StocksrModel actionsrModelFromJson(var data) => StocksrModel.fromJson(data);

String actionsrModelToJson(StocksrModel data) => json.encode(data.toJson());

class StocksrModel {
  StocksrModel({
    this.success,
    this.data,
    this.error,
  });
  bool? success;
  List<Datum>? data;
  dynamic error;

  factory StocksrModel.fromJson(Map<String, dynamic> json) => StocksrModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    this.favorite = false,
    this.id,
    this.name,
    this.ticker,
    this.minimumValue,
    this.profitability,
  });

  int? id;
  String? name;
  bool? favorite;
  String? ticker;
  double? minimumValue;
  double? profitability;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        ticker: json["ticker"],
        minimumValue: json["minimumValue"].toDouble(),
        profitability: json["profitability"].toDouble(),
      );

  bool changeFav() {
    return favorite = true;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ticker": ticker,
        "minimumValue": minimumValue,
        "profitability": profitability,
      };
}

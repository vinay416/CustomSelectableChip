class DataModel {
  const DataModel({
    required this.id,
    required this.value,
  });

  final String id;
  final String value;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["_id"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "value": value};
  }
}

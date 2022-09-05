class SkillModel {
  const SkillModel({
    required this.id,
    required this.skill,
  });

  final String id;
  final String skill;

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json["_id"],
      skill: json["value"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"_id": id, "value": skill};
  }
}

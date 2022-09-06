import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomSelectableRepo {
  Future<List<SkillModel>> getSkills(String apiUrl) async {
    try {
      final response = await Dio().get(
        apiUrl,
        options: Options(
          headers: _authHeader,
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> skills = data["result"];
        final List<SkillModel> list =
            skills.map((e) => SkillModel.fromJson(e)).toList();

        return list;
      }
      return [];
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Map<String, dynamic> get _authHeader {
    return {
      "content-type": "application/json",
      "Authorization":
          "Basic eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiclhnY1Y2YXh3eVRobTNQdE04aGtSaXJTQ2ZsMiIsImlhdCI6MTY2MjQ1ODUyNywiZXhwIjoxNjYyNTQ0OTI3fQ.ihNAgDyt3miZz9opJoNbQSlG21A4TMMOhNkKDbZBMFo"
    };
  }
}

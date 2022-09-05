import 'dart:convert';
import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CustomSelectableRepo {
  Future<List<SkillModel>?> getSkills(String apiUrl) async {
    try {
      final response = await Dio().get(apiUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> skills = data["data"];
        final List<SkillModel> list =
            skills.map((e) => SkillModel.fromJson(e)).toList();

        return list;
      }
      return null;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

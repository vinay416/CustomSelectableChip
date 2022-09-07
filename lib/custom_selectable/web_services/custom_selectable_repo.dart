import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        if (skills.isEmpty) {
          _showToast("Error : ${response.data["message"]}");
        }
        final List<SkillModel> list =
            skills.map((e) => SkillModel.fromJson(e)).toList();
        return list;
      }
      _showToast("Error : ${response.statusCode}");
      return [];
    } on Exception catch (e) {
      debugPrint(e.toString());
      _showToast("Error : $e");
    }
    return [];
  }

  Map<String, dynamic> get _authHeader {
    return {
      "content-type": "application/json",
      "Authorization": "Basic $_token"
    };
  }

  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiclhnY1Y2YXh3eVRobTNQdE04aGtSaXJTQ2ZsMiIsImlhdCI6MTY2MjU1MTgwOCwiZXhwIjoxNjYyNjM4MjA4fQ.RGJM_0Iqfcq-WZi6Kqtj25eso5t7sdoDxUBjRySGoLI";

  void _showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}

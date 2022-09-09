import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class CustomSelectableRepo extends ChangeNotifier {
  final List<Map<String, dynamic>> rawDataList = [];

  Future<void> getRawData(String apiUrl) async {
    try {
      final response = await Dio().get(
        apiUrl,
        options: Options(
          headers: _authHeader,
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final List skills = data["result"];
        if (skills.isEmpty) {
          _showToast("Error : ${response.data["message"]}");
        }

        List<Map<String, dynamic>> list = skills.map((e) {
          final Map<String, dynamic> map = {
            "_id": e["_id"],
            "value": e["value"]
          };

          return map;
        }).toList();

        rawDataList.addAll(list);

        notifyListeners();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      _showToast("Error : $e");
    }
  }

  Map<String, dynamic> get _authHeader {
    return {
      "content-type": "application/json",
      "Authorization": "Basic $_token"
    };
  }

  final String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiclhnY1Y2YXh3eVRobTNQdE04aGtSaXJTQ2ZsMiIsImlhdCI6MTY2MjcwNzY1MCwiZXhwIjoxNjYyNzk0MDUwfQ.N8s_lU9kEQy6yusGo5NCWFolZzgZnVxYBHrjQLKKOtA";

  void _showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}

class SkillsRepo extends CustomSelectableRepo {}

class HobbiesRepo extends CustomSelectableRepo {}

class SubjectsRepo extends CustomSelectableRepo {}

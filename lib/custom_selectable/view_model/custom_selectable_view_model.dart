import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:flutter/cupertino.dart';

class CustomSelectableViewModel extends ChangeNotifier {
  final List<DataModel> _allSkills = [];

  final List<DataModel> _suggestions = [];

  final List<DataModel> _selected = [];

  bool isFocused = false;

  int countSelected = 0;

  Future<void> parseData(List<Map<String, dynamic>> rawDataList) async {
    final modelList = rawDataList.map((e) => DataModel.fromJson(e)).toList();

    _allSkills.addAll(modelList);

    _suggestions.addAll(_allSkills);

    await Future.delayed(Duration.zero);
    notifyListeners();
  }

  void suggestionListener(String text) {
    _suggestions.clear();

    if (text.isEmpty) {
      for (var skill in _allSkills) {
        _suggestions.add(skill);
      }
      _suggestions.sort(_sort);
    } else {
      final String query = text.toLowerCase();

      final suggestion = _allSkills
          .where((element) => element.value.toLowerCase().contains(query))
          .toList(growable: false)
        ..sort((a, b) => a.value
            .toLowerCase()
            .indexOf(query)
            .compareTo(b.value.toLowerCase().indexOf(query)));

      for (var skill in suggestion) {
        _suggestions.add(skill);
      }
    }

    for (var skill in _selected) {
      _suggestions.removeWhere((element) => element.id == skill.id);
    }

    notifyListeners();
  }

  List<DataModel> get suggestions => List.unmodifiable(_suggestions);

  void addSkill(DataModel skillModel) {
    _selected.add(skillModel);
    _suggestions.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.sort(_sort);
    countSelected = _selected.length;
    notifyListeners();
  }

  void deleteSkill(DataModel skillModel) {
    _selected.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.add(skillModel);
    _suggestions.sort(_sort);
    notifyListeners();
  }

  List<DataModel> get selectedSkills => List.unmodifiable(_selected);

  List<Map<String, dynamic>> get selectedSkillsJson {
    final List<Map<String, dynamic>> list = [];

    list.addAll(_selected.map((e) => e.toJson()));

    return list;
  }

  int _sort(DataModel a, DataModel b) {
    return a.value
        .toLowerCase()
        .indexOf(b.value)
        .compareTo(b.value.toLowerCase().indexOf(a.value));
  }

  void focusListener(bool value) {
    isFocused = value;
    notifyListeners();
  }
}

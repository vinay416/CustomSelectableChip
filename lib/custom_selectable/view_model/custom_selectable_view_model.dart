import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:flutter/cupertino.dart';

class CustomSelectableViewModel extends ChangeNotifier {
  final List<SkillModel> _allSkills = [];

  final List<SkillModel> _suggestions = [];

  final List<SkillModel> _selected = [];

  bool isFocused = false;

  int countSelected = 0;

  Future<void> fetchSkills(List<Map<String, dynamic>> rawDataList) async {
    for (var i = 0; i < 11; i++) {
      _allSkills.add(SkillModel(id: i.toString(), skill: "skill $i"));
    }

    _suggestions.addAll(_allSkills);

    await Future.delayed(Duration(seconds: 1));
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
          .where((element) => element.skill.toLowerCase().contains(query))
          .toList(growable: false)
        ..sort((a, b) => a.skill
            .toLowerCase()
            .indexOf(query)
            .compareTo(b.skill.toLowerCase().indexOf(query)));

      for (var skill in suggestion) {
        _suggestions.add(skill);
      }
    }

    for (var skill in _selected) {
      _suggestions.removeWhere((element) => element.id == skill.id);
    }

    notifyListeners();
  }

  List<SkillModel> get suggestions => List.unmodifiable(_suggestions);

  void addSkill(SkillModel skillModel) {
    _selected.add(skillModel);
    _suggestions.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.sort(_sort);
    countSelected = _selected.length;
    notifyListeners();
  }

  void deleteSkill(SkillModel skillModel) {
    _selected.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.add(skillModel);
    _suggestions.sort(_sort);
    notifyListeners();
  }

  List<SkillModel> get selectedSkills => List.unmodifiable(_selected);

  List<Map<String, dynamic>> get selectedSkillsJson {
    final List<Map<String, dynamic>> list = [];

    list.addAll(_selected.map((e) => e.toJson()));

    return list;
  }

  int _sort(SkillModel a, SkillModel b) {
    return a.skill
        .toLowerCase()
        .indexOf(b.skill)
        .compareTo(b.skill.toLowerCase().indexOf(a.skill));
  }

  void focusListener(bool value) {
    isFocused = value;
    notifyListeners();
  }
}

import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:flutter/cupertino.dart';

class CustomSelectableViewModel extends ChangeNotifier {
  final List<SkillModel> _allSkills = [];

  final List<SkillModel> _suggestions = [];

  final List<SkillModel> _selected = [];

  bool isFocused = false;

  Future<void> fetchSkills() async {
    await Future.delayed(const Duration(seconds: 1));

    for (var i = 0; i < 20; i++) {
      _allSkills.add(SkillModel(id: "$i", skill: "skill $i"));
    }

    notifyListeners();
  }

  void suggestionListener(String text) {
    _suggestions.clear();

    if (text.isEmpty) {
      for (var skill in _allSkills) {
        _suggestions.add(skill);
      }
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

    notifyListeners();
  }

  List<SkillModel> get suggestions => List.unmodifiable(_suggestions);

  void addSkill(SkillModel skillModel) {
    _selected.add(skillModel);
    _suggestions.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.sort(_sort);
    notifyListeners();
  }

  void deleteSkill(SkillModel skillModel) {
    _selected.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.insert(int.parse(skillModel.id), skillModel);
    _suggestions.sort(_sort);
    notifyListeners();
  }

  List<SkillModel> get selectedSkills => List.unmodifiable(_selected);

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

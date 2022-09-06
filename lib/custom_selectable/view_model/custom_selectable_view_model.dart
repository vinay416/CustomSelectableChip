import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/web_services/custom_selectable_repo.dart';
import 'package:flutter/cupertino.dart';

class CustomSelectableViewModel extends ChangeNotifier {
  late List<SkillModel> _allSkills;

  final List<SkillModel> _suggestions = [];

  final List<SkillModel> _selected = [];

  bool isFocused = false;

  Future<void> fetchSkills(String apiUrl) async {
    final List<SkillModel> list =
        await CustomSelectableRepo().getSkills(apiUrl);

    _allSkills = list;

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
    notifyListeners();
  }

  void deleteSkill(SkillModel skillModel) {
    _selected.removeWhere((skill) => skill.id == skillModel.id);
    _suggestions.add(skillModel);
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

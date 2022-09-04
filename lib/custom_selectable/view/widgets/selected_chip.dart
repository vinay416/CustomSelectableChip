import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/utils/utlis.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedChip extends StatelessWidget {
  const SelectedChip({required this.element, Key? key}) : super(key: key);
  final SkillModel element;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(element.skill),
        shape: chipBorder,
        deleteIcon: const Icon(Icons.clear),
        onDeleted: () {
          context.read<CustomSelectableViewModel>().deleteSkill(element);
        },
      ),
    );
  }
}

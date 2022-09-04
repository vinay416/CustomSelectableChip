import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/utils/utlis.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

class SuggestionChip extends StatelessWidget {
  const SuggestionChip({required this.skill, Key? key}) : super(key: key);
  final SkillModel skill;

  @override
  Widget build(BuildContext context) {
    return TransparentPointer(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            context.read<CustomSelectableViewModel>().addSkill(skill);
          },
          child: Chip(
            label: Text(skill.skill),
            shape: chipBorder,
          ),
        ),
      ),
    );
  }
}

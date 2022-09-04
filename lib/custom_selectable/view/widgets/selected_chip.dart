import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/utils/utlis.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedChip extends StatelessWidget {
  const SelectedChip({
    required this.element,
    this.backgroundColor,
    this.textStyle,
    this.deleteIconColor,
    this.deleteIcon,
    Key? key,
  }) : super(key: key);
  final SkillModel element;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? deleteIconColor;
  final IconData? deleteIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(
          element.skill,
          style: textStyle ?? chipTextStyle,
        ),
        backgroundColor: backgroundColor ?? chipBackgroundColor,
        shape: chipBorder,
        deleteIcon: Icon(
          deleteIcon ?? Icons.clear,
          color: deleteIconColor ?? Colors.blue,
        ),
        onDeleted: () {
          context.read<CustomSelectableViewModel>().deleteSkill(element);
        },
      ),
    );
  }
}

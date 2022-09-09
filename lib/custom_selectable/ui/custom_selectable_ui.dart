import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/selected_builder.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/suggestion_builder.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:custom_chip/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelectable extends StatelessWidget {
  const CustomSelectable({
    required this.selectedSills,
    required this.apiUrl,
    required this.provider,
    this.horizontalMargin = 0,
    this.backgroundColor,
    this.deleteIcon,
    this.deleteIconColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);
  final double horizontalMargin;
  final Function(List<SkillModel>) selectedSills;
  final String apiUrl;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? deleteIconColor;
  final IconData? deleteIcon;
  final CustomSelectableViewModel provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomSelectableViewModel>(
      create: (context) => provider..fetchSkills(apiUrl),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        width: 390,
        child: Stack2(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
            ),
            SelectedBuilder(
              viewModel: provider,
              apiUrl: apiUrl,
              selectedSills: selectedSills,
              backgroundColor: backgroundColor,
              textStyle: textStyle,
            ),
            SuggestionBuilder(
              horizontalMargin: horizontalMargin,
              backgroundColor: backgroundColor,
              textStyle: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

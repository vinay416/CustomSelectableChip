import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/selected_builder.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/suggestion_builder.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelectable extends StatelessWidget {
  const CustomSelectable({
    required this.selectedSills,
    required this.apiUrl,
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

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CustomSelectableViewModel>();
    viewModel.fetchSkills(apiUrl);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
          ),
          SelectedBuilder(
            viewModel: viewModel,
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
    );
  }
}

import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/view/widgets/selected_builder.dart';
import 'package:custom_chip/custom_selectable/view/widgets/suggestion_builder.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelectable extends StatelessWidget {
  const CustomSelectable({
    required this.selectedSills,
    this.horizontalMargin = 0,
    Key? key,
  }) : super(key: key);
  final double horizontalMargin;
  final Function(List<SkillModel>) selectedSills;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CustomSelectableViewModel>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
            ),
            SelectedBuilder(viewModel: viewModel, selectedSills: selectedSills),
            SuggestionBuilder(horizontalMargin: horizontalMargin),
          ],
        ),
      ),
    );
  }
}

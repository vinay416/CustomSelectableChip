import 'package:custom_chip/custom_selectable/ui/widgets/selected_builder.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/suggestion_builder.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:custom_chip/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelectable extends StatelessWidget {
  const CustomSelectable({
    required this.selectedValues,
    required this.rawDataList,
    required this.provider,
    this.horizontalMargin = 0,
    this.backgroundColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);
  final double horizontalMargin;
  final Function(List<Map<String, dynamic>>) selectedValues;
  final List<Map<String, dynamic>> rawDataList;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final CustomSelectableViewModel provider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomSelectableViewModel>(
      create: (context) => provider..fetchSkills(rawDataList),
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
              selected: selectedValues,
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

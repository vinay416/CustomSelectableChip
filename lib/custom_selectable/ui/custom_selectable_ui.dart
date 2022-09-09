import 'package:custom_chip/custom_selectable/ui/widgets/selected_builder.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/suggestion_builder.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:custom_chip/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelectable extends StatefulWidget {
  const CustomSelectable({
    required this.selectedValues,
    required this.rawDataList,
    this.backgroundColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);
  final Function(List<Map<String, dynamic>>) selectedValues;
  final List<Map<String, dynamic>> rawDataList;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  State<CustomSelectable> createState() => _CustomSelectableState();
}

class _CustomSelectableState extends State<CustomSelectable> {
  final CustomSelectableViewModel provider = CustomSelectableViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomSelectableViewModel>(
      create: (context) => provider..fetchSkills(widget.rawDataList),
      child: SizedBox(
        width: 390,
        child: Stack2(
          children: [
            SelectedBuilder(
              viewModel: provider,
              selected: widget.selectedValues,
              backgroundColor: widget.backgroundColor,
              textStyle: widget.textStyle,
            ),
            SuggestionBuilder(
              backgroundColor: widget.backgroundColor,
              textStyle: widget.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

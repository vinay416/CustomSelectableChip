import 'package:custom_chip/custom_selectable/utils/utlis.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/suggestion_chip.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionBuilder extends StatelessWidget {
  const SuggestionBuilder({
    required this.horizontalMargin,
    this.backgroundColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final double horizontalMargin;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        if (!viewModel.isFocused) {
          return Container();
        }

        return Positioned(
          top: 50,
          height: 90,
          width: MediaQuery.of(context).size.width - (horizontalMargin * 2),
          child: Material(
            elevation: 5.0,
            child: Container(
              decoration: BoxDecoration(
                border: boderDecoration,
                color: Colors.white,
              ),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Scrollbar(
                isAlwaysShown: true,
                interactive: true,
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: Wrap(
                      children: viewModel.suggestions
                          .map((skill) => SuggestionChip(
                                skill: skill,
                                backgroundColor: backgroundColor,
                                textStyle: textStyle,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

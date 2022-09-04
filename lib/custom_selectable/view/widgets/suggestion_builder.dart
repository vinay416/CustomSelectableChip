import 'package:custom_chip/custom_selectable/view/widgets/suggestion_chip.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionBuilder extends StatelessWidget {
  const SuggestionBuilder({
    required this.horizontalMargin,
    Key? key,
  }) : super(key: key);

  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        if (!viewModel.isFocused) {
          return Container();
        }

        return Positioned(
          top: 58,
          height: 200,
          width: MediaQuery.of(context).size.width *
              (100 / (80 + horizontalMargin)),
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: Colors.blue,
            child: SingleChildScrollView(
              child: Wrap(
                children: viewModel.suggestions
                    .map((skill) => SuggestionChip(skill: skill))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

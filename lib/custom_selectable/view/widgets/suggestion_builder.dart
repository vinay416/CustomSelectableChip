import 'package:custom_chip/custom_selectable/view/widgets/suggestion_chip.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionBuilder extends StatelessWidget {
  const SuggestionBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        if (!viewModel.isFocused) {
          return Container();
        }

        return Positioned(
          top: 55,
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
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

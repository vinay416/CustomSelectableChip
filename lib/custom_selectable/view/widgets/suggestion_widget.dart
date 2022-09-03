import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
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
          top: 60,
          height: 200,
          width: 500,
          child: Container(
            alignment: Alignment.topLeft,
            color: Colors.blue,
            child: Wrap(
                children: viewModel.suggestions
                    .map(
                      (skill) => GestureDetector(
                        onTap: () {
                          viewModel.addSkill(skill);
                        },
                        child: Chip(label: Text(skill.skill)),
                      ),
                    )
                    .toList()),
          ),
        );
      },
    );
  }
}

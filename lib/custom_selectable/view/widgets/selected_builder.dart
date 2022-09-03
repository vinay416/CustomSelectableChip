import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedBuilder extends StatelessWidget {
  const SelectedBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          child: Row(
            children: viewModel.selectedSkills
                .map((e) => Chip(label: Text(e.skill)))
                .toList(),
          ),
        );
      },
    );
  }
}

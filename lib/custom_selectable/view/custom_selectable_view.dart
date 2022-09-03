import 'package:custom_chip/custom_selectable/view/widgets/textfiled_chip.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSelectable extends StatelessWidget {
  const CustomSelectable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomSelectableViewModel viewModel =
        context.read<CustomSelectableViewModel>();

    return TextFiledChip(
      viewModel: viewModel,
    );
  }
}

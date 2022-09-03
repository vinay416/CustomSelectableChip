import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedBuilder extends StatefulWidget {
  const SelectedBuilder({Key? key}) : super(key: key);

  @override
  State<SelectedBuilder> createState() => _SelectedBuilderState();
}

class _SelectedBuilderState extends State<SelectedBuilder> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        double width = 0;
        for (var item in viewModel.selectedSkills) {
          width += item.skill.length + 50;
        }

        if (_controller.hasClients) {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }

        return Container(
          width: width,
          constraints: const BoxConstraints(minWidth: 0, maxWidth: 350),
          child: SingleChildScrollView(
            controller: _controller,
            padding: const EdgeInsets.only(top: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: viewModel.selectedSkills
                  .map((e) => Chip(label: Text(e.skill)))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

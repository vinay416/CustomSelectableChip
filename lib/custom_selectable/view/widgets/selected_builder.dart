import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedBuilder extends StatefulWidget {
  const SelectedBuilder({required this.viewModel, Key? key}) : super(key: key);
  final CustomSelectableViewModel viewModel;

  @override
  State<SelectedBuilder> createState() => _SelectedBuilderState();
}

class _SelectedBuilderState extends State<SelectedBuilder> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _editingController = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    widget.viewModel.fetchSkills();
    _focus.addListener(() => widget.viewModel.focusListener(_focus.hasFocus));
    _editingController.addListener(
        () => widget.viewModel.suggestionListener(_editingController.text));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        if (_controller.hasClients) {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }

        if (!viewModel.isFocused && _controller.hasClients) {
          _controller.animateTo(
            _controller.position.minScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: SingleChildScrollView(
            controller: _controller,
            padding: const EdgeInsets.only(top: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...viewModel.selectedSkills
                    .map((e) => Chip(label: Text(e.skill)))
                    .toList(),
                Container(
                  constraints: BoxConstraints(
                    minWidth: 100,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: TextField(
                    focusNode: _focus,
                    controller: _editingController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    _editingController.dispose();
    super.dispose();
  }
}

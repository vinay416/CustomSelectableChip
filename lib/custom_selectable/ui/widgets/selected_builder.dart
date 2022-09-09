import 'package:custom_chip/custom_selectable/utils/utlis.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/selected_chip.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/textfield_builder.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedBuilder extends StatefulWidget {
  const SelectedBuilder({
    required this.viewModel,
    required this.selected,
    this.backgroundColor,
    this.textStyle,
    this.hinText,
    Key? key,
  }) : super(key: key);
  final CustomSelectableViewModel viewModel;
  final Function(List<Map<String, dynamic>>) selected;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? hinText;

  @override
  State<SelectedBuilder> createState() => _SelectedBuilderState();
}

class _SelectedBuilderState extends State<SelectedBuilder> {
  final ScrollController _controller = ScrollController();
  final TextEditingController _editingController = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    _focus.addListener(() => widget.viewModel.focusListener(_focus.hasFocus));
    _editingController.addListener(
        () => widget.viewModel.suggestionListener(_editingController.text));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomSelectableViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.selectedSkills.isNotEmpty) {
          widget.selected(viewModel.selectedSkillsJson);
        }

        if (_controller.hasClients &&
            viewModel.selectedSkills.length == viewModel.countSelected) {
          _controller.animateTo(
            _controller.position.maxScrollExtent - 200,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        } else if (_controller.hasClients &&
            viewModel.selectedSkills.length < viewModel.countSelected) {
          _controller.animateTo(
            _controller.position.pixels - 100,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }

        return Container(
          decoration: BoxDecoration(
            border: boderDecoration,
            borderRadius: borderRadius,
          ),
          child: Scrollbar(
            interactive: true,
            controller: _controller,
            scrollbarOrientation: ScrollbarOrientation.top,
            child: SingleChildScrollView(
              controller: _controller,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...viewModel.selectedSkills
                      .map((e) => SelectedChip(
                            element: e,
                            backgroundColor: widget.backgroundColor,
                            textStyle: widget.textStyle,
                          ))
                      .toList(),
                  TextFieldbuilder(
                    controller: _editingController,
                    focus: _focus,
                    hintText: widget.hinText,
                    isEmpty: viewModel.selectedSkills.isEmpty,
                  ),
                ],
              ),
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

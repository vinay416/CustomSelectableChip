import 'package:custom_chip/custom_selectable/view/widgets/selected_chips.dart';
import 'package:custom_chip/custom_selectable/view/widgets/suggestion_widget.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';

class TextFiledChip extends StatefulWidget {
  const TextFiledChip({required this.viewModel, Key? key}) : super(key: key);
  final CustomSelectableViewModel viewModel;

  @override
  State<TextFiledChip> createState() => _TextFiledChipState();
}

class _TextFiledChipState extends State<TextFiledChip> {
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          focusNode: _focus,
          controller: _editingController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        const SelectedChips(),
        const SuggestionWidget()
      ],
    );
  }

  @override
  void dispose() {
    _editingController.dispose();
    _focus.dispose();
    super.dispose();
  }
}

import 'package:custom_chip/custom_selectable/utils/utlis.dart';
import 'package:custom_chip/custom_selectable/ui/widgets/suggestion_chip.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionBuilder extends StatefulWidget {
  const SuggestionBuilder({
    this.backgroundColor,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  final Color? backgroundColor;
  final TextStyle? textStyle;

  @override
  State<SuggestionBuilder> createState() => _SuggestionBuilderState();
}

class _SuggestionBuilderState extends State<SuggestionBuilder> {
  final ScrollController scrollController = ScrollController();

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
          width: 390,
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
                controller: scrollController,
                interactive: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Wrap(
                    children: viewModel.suggestions
                        .map((skill) => SuggestionChip(
                              skill: skill,
                              backgroundColor: widget.backgroundColor,
                              textStyle: widget.textStyle,
                            ))
                        .toList(),
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

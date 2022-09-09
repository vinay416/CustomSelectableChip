import 'package:custom_chip/custom_selectable/ui/custom_selectable_ui.dart';
import 'package:custom_chip/custom_selectable/web_services/custom_selectable_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 390,
      child: Consumer<SkillsRepo>(builder: (context, value, child) {
        if (value.rawDataList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomSelectable(
          rawDataList: value.rawDataList,
          selectedValues: (list) {
            for (var element in list) {
              debugPrint(element.toString());
            }
          },
        );
      }),
    );
  }
}

import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/ui/custom_selectable_ui.dart';
import 'package:custom_chip/custom_selectable/view_model/custom_selectable_view_model.dart';
import 'package:custom_chip/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:transparent_pointer/transparent_pointer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Stack2(
        children: [
          Positioned(
            top: 100,
            child: Container(
              color: Colors.black,
              height: 100,
              width: 390,
              child: InkWell(
                // onTap: () => print("black"),
                child: getSkill(),
              ),
            ),
          ),
          Container(
            color: Colors.red,
            height: 100,
            width: 390,
            child: InkWell(
              // onTap: () => print("red"),
              child: getSkill(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSkill() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: CustomSelectable(
        rawDataList: getRaw(),
        provider: CustomSelectableViewModel(),
        selectedValues: (list) {
          for (var element in list) {
            debugPrint(element.toString());
          }
        },
      ),
    );
  }

  List<Map<String, dynamic>> getRaw() {
    List<Map<String, dynamic>> raw = [];

    for (var i = 0; i < 11; i++) {
      raw.add(SkillModel(id: i.toString(), skill: "skill $i").toJson());
    }

    return raw;
  }
}

import 'package:custom_chip/custom_selectable/model/skill_model.dart';
import 'package:custom_chip/custom_selectable/ui/custom_selectable_ui.dart';
import 'package:custom_chip/custom_stack.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack2(
            children: [
              Positioned(
                top: 100,
                child: Container(
                  color: Colors.black,
                  height: 120,
                  width: 390,
                  child: getSkill(),
                ),
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: 390,
                child: getSkill(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getSkill() {
    return CustomSelectable(
      rawDataList: getRaw(),
      selectedValues: (list) {
        for (var element in list) {
          debugPrint(element.toString());
        }
      },
    );
  }

  List<Map<String, dynamic>> getRaw() {
    List<Map<String, dynamic>> raw = [];

    for (var i = 0; i < 11; i++) {
      raw.add(DataModel(id: i.toString(), value: "skill $i").toJson());
    }

    return raw;
  }
}

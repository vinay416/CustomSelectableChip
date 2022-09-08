import 'package:custom_chip/custom_selectable/ui/custom_selectable_ui.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          getSkill(),
          Positioned(
            top: 100,
            child: SizedBox(
              height: 90,
              width: 390,
              child: getSkill(),
            ),
          )
        ],
      ),
    );
  }

  Widget getSkill() {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: CustomSelectable(
          apiUrl: "https://dev.elred.io/getSkills",
          selectedSills: (list) {
            for (var element in list) {
              debugPrint(element.skill);
            }
          },
        ),
      ),
    );
  }
}

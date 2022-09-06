import 'package:custom_chip/custom_selectable/view/custom_selectable_view.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: CustomSelectable(
          horizontalMargin: 20,
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

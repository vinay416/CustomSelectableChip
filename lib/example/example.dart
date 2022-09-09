import 'package:custom_chip/custom_selectable/custom_stack.dart';
import 'package:custom_chip/example/hobbies_widget.dart';
import 'package:custom_chip/example/skills_widget.dart';
import 'package:custom_chip/example/subjects_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack2(
                  children: const [
                    Positioned(
                      top: 200,
                      child: SubjectsWidget(),
                    ),
                    Positioned(
                      top: 100,
                      child: HobbiesWidget(),
                    ),
                    SkillsWidget(),
                  ],
                ),
                const SizedBox(
                  height: 300,
                ),
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text("Done"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

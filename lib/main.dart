import 'package:custom_chip/custom_selectable/web_services/custom_selectable_repo.dart';
import 'package:custom_chip/example/example.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SkillsRepo>(
          create: (context) =>
              SkillsRepo()..getRawData("https://dev.elred.io/getSkills"),
        ),
        ChangeNotifierProvider<HobbiesRepo>(
          create: (context) =>
              HobbiesRepo()..getRawData("https://dev.elred.io/getHobbies"),
        ),
        ChangeNotifierProvider<SubjectsRepo>(
          create: (context) =>
              SubjectsRepo()..getRawData("https://dev.elred.io/getSubjects"),
        )
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

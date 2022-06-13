import 'package:flutter/material.dart';
import 'package:study_project/lectures/stream_by_filledstack.dart';
import 'package:study_project/lectures/stream_by_thegrowingdeveloper.dart';

import 'lectures/stream_test1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //const Stream_FilledStack(),
          //const StreamTest1(),
          StreamByTheGrowingDeveloper(),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class StreamByTheGrowingDeveloper extends StatelessWidget {
  late StreamController streamController = StreamController();
  late Stream myStream = streamController.stream.asBroadcastStream();
  late StreamSubscription mySub;

  //int count = 0;

  Stream<int> getData() async* {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 50));
      yield i;
    }
    throw "Completed";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder<int>(
              stream: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int count = snapshot.data!;
                  return Text("$count");
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return const Text("No data");
                }
              })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          streamController.add(1);
        },
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Stream_FilledStack extends StatefulWidget {
  const Stream_FilledStack({Key? key}) : super(key: key);

  @override
  State<Stream_FilledStack> createState() => _Stream_FilledStackState();
}

class _Stream_FilledStackState extends State<Stream_FilledStack> {
  StreamController<double> controller = StreamController<double>.broadcast();
  StreamSubscription<double>? streamSubscription;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: Colors.yellow,
              child: const Text("Subcription"),
              onPressed: () async {
                Stream stream = controller.stream;
                streamSubscription = stream.listen((event) {
                  print("Value from the controller $event");
                }) as StreamSubscription<double>?;
                // getDelayedRandomValue().listen((event) {
                //   print("Value From manualStream: ${event}");
                // });
              },
            ),
            MaterialButton(
              child: Text("Emit Value"),
              color: Colors.blueAccent,
              onPressed: () {
                //controller.add(12);
                controller.sink.add(12);
              },
            ),
            MaterialButton(
              color: Colors.red,
              child: const Text("Unsubscription"),
              onPressed: () {
                // streamSubscription!.cancel();
              },
            )
          ],
        ),
      ),
    );
  }

  Stream<double> getDelayedRandomValue() async* {
    var random = Random();
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble() * 100;
    }
  }
}

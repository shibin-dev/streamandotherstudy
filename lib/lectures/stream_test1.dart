import 'package:flutter/material.dart';

class StreamTest1 extends StatelessWidget {
  const StreamTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "StreamBuilder",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            StreamBuilder<int>(
              stream: numberCount(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("Stream is null");
                  case ConnectionState.waiting:
                    return const Text("Waiting");
                  case ConnectionState.active:
                    if (snapshot.hasData) {
                      return Text("${snapshot.data}");
                    } else {
                      return const Text("No Data");
                    }
                  case ConnectionState.done:
                    return const Text("Done");
                  default:
                    return Container();
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "FutureBuilder",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: numberFuture(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data}");
                } else {
                  return Text("No data");
                }
                // switch (snapshot.connectionState) {
                //   case ConnectionState.none:
                //     return const Text("Future is null");
                //   case ConnectionState.waiting:
                //     return const Text("Waiting");
                //   case ConnectionState.active:
                //     if (snapshot.hasData) {
                //       return Text("${snapshot.data}");
                //     } else {
                //       return const Text("No data");
                //     }
                //   case ConnectionState.done:
                //     return const Text("Done");
                //   default:
                //     return Container();
                // }
              },
            )
          ],
        ),
      ),
    );
  }

  Stream<int> numberCount() async* {
    List<int> number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    for (var i in number) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  Future<int> numberFuture() async {
    await Future.delayed(const Duration(seconds: 1));
    return 2;
  }
}

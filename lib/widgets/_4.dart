import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;
  int count = 0;

  // toggle
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onPressed() {
    setState(() {
      count = count + 1;
    });
  }

  int counter = 0;
  List<int> numbers = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xfff4eddb),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  showTitle
                      ? const MyLargeTitle()
                      : const Text('nothing to see'),
                  IconButton(
                      onPressed: toggleTitle,
                      icon: const Icon(Icons.remove_red_eye_outlined))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text(
                    'click',
                    style: TextStyle(
                      fontSize: 40,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$count',
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: onPressed,
                        icon: const Icon(Icons.add_box_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    print('initState!!');
  }

  @override
  void dispose() {
    super.dispose();
    print('delete somthing');
  }

  @override
  Widget build(BuildContext context) {
    print('build!!!');
    return Column(
      children: [
        Text(
          'My Large Title',
          style: TextStyle(
            fontSize: 40,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
      ],
    );
  }
}

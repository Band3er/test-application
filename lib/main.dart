import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Test Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double xCoordinate = 0;
  double yCoordinate = 0;

  List<Map<String, int>> colorHistory = [
    {'red': 255, 'green': 255, 'blue': 255},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final hexColor =
        "${colorHistory.last['red']?.toRadixString(16)}"
        "${colorHistory.last['green']?.toRadixString(16)}"
        "${colorHistory.last['blue']?.toRadixString(16)}";

    log(colorHistory.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_return),
          onPressed: () => _previousColor(colorHistory),
        ),
        title: Text(widget.title),
      ),
      backgroundColor: _setColor(
        colorHistory.last['red']!,
        colorHistory.last['green']!,
        colorHistory.last['blue']!,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _onTapDown,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello there", style: TextStyle(fontSize: width * 0.1)),
              Text("#$hexColor", style: TextStyle(fontSize: width * 0.08)),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    xCoordinate = details.globalPosition.dx;
    yCoordinate = details.globalPosition.dy;

    final colorRed = xCoordinate.round() % 256;
    final colorGreen = yCoordinate.round() % 256;
    final colorBlue = (xCoordinate * yCoordinate).round() % 256;

    setState(() {
      colorHistory.add({
        'red': colorRed,
        'green': colorGreen,
        'blue': colorBlue,
      });
    });

    log("dx: $xCoordinate \n dy: $yCoordinate");
  }

  Color? _setColor(int colorRed, int colorGreen, int colorBlue) {
    return Color.fromRGBO(colorRed, colorGreen, colorBlue, 1);
  }

  void _previousColor(List<dynamic> colorHistory) {
    setState(() {
      if (colorHistory.length <= 1) return;
        colorHistory.removeLast();
        log(colorHistory.toString());
    });
  }
}

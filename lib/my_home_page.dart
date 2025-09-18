import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> _colorHistory = <Color>[Colors.white];
  final math.Random _random = math.Random();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final Color currentColor = _colorHistory.last;

    final int argb = currentColor.toARGB32();
    final String hexColor = (argb & 0xFFFFFF)
        .toRadixString(16)
        .padLeft(6, '0')
        .toUpperCase();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_return),
          onPressed: _previousColor,
        ),
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: currentColor,
          alignment: Alignment.center,
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

  void _onTap() {
    final int colorInt = _random.nextInt(1 << 24);

    final int red = (colorInt >> 16) & 0xFF;
    final int green = (colorInt >> 8) & 0xFF;
    final int blue = colorInt & 0xFF;

    // ignore: no_magic_number
    final Color newColor = Color.fromARGB(255, red, green, blue);

    setState(() {
      _colorHistory.add(newColor);
    });
  }

  void _previousColor() {
    setState(() {
      if (_colorHistory.length <= 1) {
        return;
      }

      _colorHistory.removeLast();
    });
  }
}

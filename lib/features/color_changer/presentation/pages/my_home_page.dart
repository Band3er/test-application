import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:test_application/features/color_changer/presentation/widgets/color_history_bottom_sheet.dart';

/// Main page of the application.
///
/// Displays a tappable screen that changes background color randomly.
/// The current and previous colors are stored in a history list, which
/// can be viewed from a floating action button.
class MyHomePage extends StatefulWidget {
  /// Creates a [MyHomePage] with the given [title].
  const MyHomePage({required this.title, super.key});

  /// Title displayed in the app bar.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> _colorHistory = <Color>[Colors.white];
  final math.Random _random = math.Random();

  static const int _fullOpacity = 0xFF;

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
      floatingActionButton: FloatingActionButton(
        tooltip: "View color history",
        onPressed: _showColorHistory,
        child: const Icon(Icons.history),
      ),
    );
  }

  void _showColorHistory() {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => ColorHistoryBottomSheet(
        colors: _colorHistory,
        onColorSelected: (color) {
          setState(() {
            _colorHistory.add(color);
          });
        },
      ),
    );
  }

  void _onTap() {
    final int colorInt = _random.nextInt(1 << 24);

    final int red = (colorInt >> 16) & 0xFF;
    final int green = (colorInt >> 8) & 0xFF;
    final int blue = colorInt & 0xFF;

    final Color newColor = Color.fromARGB(_fullOpacity, red, green, blue);

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

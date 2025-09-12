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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? xCoordinate = 0;
  double? yCoordinate = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Color.fromRGBO((xCoordinate! % 256).round(), (yCoordinate! % 256).round(), ((xCoordinate! * yCoordinate!) % 256).round(), 1),
      body: GestureDetector(
        child: Center(
          child: Text("Hello there", style: TextStyle(fontSize: width * 0.1)),
        ),
        behavior: HitTestBehavior.opaque,
        onTapDown: (TapDownDetails details) => _onTapDown(details),
      ),
    );
  }

  _onTapDown(TapDownDetails details) {
    setState(() {
      xCoordinate = details.globalPosition.dx;
      yCoordinate = details.globalPosition.dy;
    });

    print("dx: $xCoordinate \n dy: $yCoordinate");
  }
}

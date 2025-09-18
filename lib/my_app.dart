import 'package:flutter/material.dart';
import 'package:test_application/features/color_changer/presentation/pages/my_home_page.dart';

/// Root widget of the application.
///
/// Wraps the [MaterialApp] and sets up the theme, title,
/// and the initial page of the app.
class MyApp extends StatelessWidget {
  /// Creates a new instance of [MyApp].
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const MyHomePage(title: 'Test Application'),
      debugShowCheckedModeBanner: false,
    );
  }
}

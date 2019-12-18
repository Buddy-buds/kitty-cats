import 'package:flutter/material.dart';
import 'package:test_app/src/screens/random_cat.dart';

import 'package:test_app/src/theme/style.dart' show appTheme;

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitty Cats',
      theme: appTheme,
      home: RandomCat(),
    );
  }
}

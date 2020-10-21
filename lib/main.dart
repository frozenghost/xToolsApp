import 'package:flutter/material.dart';

import 'modules/homePage.dart';
import 'route.dart';

void main() {
  runApp(XToolApp());
}

class XToolApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XTools',
      home: HomePage(),
      onGenerateRoute: onGenerateRoute,
    );
  }
}

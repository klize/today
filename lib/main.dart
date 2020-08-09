import 'package:flutter/material.dart';
import 'package:today/screens/today.dart';

import 'routes.dart';

void main() {
  runApp(Today());
}

class Today extends StatelessWidget {
  final String _title = "Today App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: TodayScreen.screenID,
      routes: routes,
    );
  }
}

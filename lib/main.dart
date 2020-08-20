import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:today/screens/today.dart';
import 'package:today/utils/database.dart';

import 'models/task_data.dart';
import 'routes.dart';

void main() {
  runApp(Today());
}

class Today extends StatelessWidget {
  final String _title = "Today App";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataBaseHelper(),
        ),
        ChangeNotifierProxyProvider<DataBaseHelper, TaskData>(
          create: (context) => TaskData([], helper: null),
          update: (context, db, previous) =>
              TaskData(previous.items, helper: db),
        ),
      ],
      child: MaterialApp(
        title: _title,
        initialRoute: TodayScreen.screenID,
        routes: routes,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // if it's a RTL language
        ],
        supportedLocales: [
          const Locale('ko', 'KR'),
          // include country code too
        ],
      ),
    );
  }
}

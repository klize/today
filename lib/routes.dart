import 'package:flutter/cupertino.dart';
import 'package:today/screens/week.dart';

import 'screens/today.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  TodayScreen.screenID: (BuildContext context) => TodayScreen(),
  WeekScreen.screenID: (BuildContext context) => WeekScreen(),
};

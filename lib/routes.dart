import 'package:flutter/cupertino.dart';
import 'package:today/widgets/task_register.dart';

import 'screens/today.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  TodayScreen.screenID: (BuildContext context) => TodayScreen(),
};

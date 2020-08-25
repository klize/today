// Colors
import 'package:flutter/material.dart';

const kAppBackgroundColor = Color(0xffffffff);
const kAppBarIconColor = Color(0xffff5640);
const kScreenTitleColor = Color(0xff303136);
const kListTileTitleColor = Color(0xff34353A);
const kListTileSubtitleColor = Color(0xff979193);
const kDayCardColor = Color(0xffE8C2C0);
const kNewTaskButtonCalendarIconColor = Color(0xffCA88F8);
const kNewTaskButtonClockIconColor = Color(0xff5FB8F9);
const kNewTaskRegisterButtonColor = Color(0xffff5640);
const kNewTaskBackgroundColor = Color(0xffffffff);
const kNewTaskButtonColor = Color(0xffffffff);
const kNewTaskETCColor = Color(0xff96DF67);
const kETCColor = Color(0xffE0E0E0);

TimePickerThemeData kTimePickerThemeData = TimePickerThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      20.0,
    ),
  ),
  hourMinuteColor: Colors.white,
  hourMinuteTextColor:
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    return states.contains(MaterialState.selected)
        ? kNewTaskRegisterButtonColor
        : Colors.black;
  }),
  hourMinuteTextStyle: TextStyle(
    fontFamily: 'GamjaFlower',
    fontSize: 50,
  ),
  dayPeriodTextStyle: TextStyle(
    fontFamily: 'GamjaFlower',
  ),
  dayPeriodTextColor:
      MaterialStateColor.resolveWith((Set<MaterialState> states) {
    return states.contains(MaterialState.selected)
        ? kNewTaskRegisterButtonColor
        : kETCColor;
  }),
  dayPeriodBorderSide: BorderSide.none,
  dialBackgroundColor: Colors.white,
  dialHandColor: kNewTaskRegisterButtonColor,
  entryModeIconColor: kNewTaskButtonClockIconColor,
);

ThemeData kDatePickerThemeData = ThemeData.light().copyWith(
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  textTheme: TextTheme(
    headline4: TextStyle(
      fontFamily: 'GamjaFlower',
    ),
    subtitle2: TextStyle(
      fontFamily: 'GamjaFlower',
    ),
    caption: TextStyle(
      fontFamily: 'GamjaFlower',
    ),
    button: TextStyle(
      fontFamily: 'GamjaFlower',
    ),
    bodyText2: TextStyle(
      fontFamily: 'GamjaFlower',
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: kAppBarIconColor,
    onPrimary: Colors.white,
    surface: kAppBackgroundColor,
    onSurface: Colors.black,
  ),
  dialogBackgroundColor: kAppBackgroundColor,
);

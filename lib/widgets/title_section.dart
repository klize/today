import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:today/utils/constants.dart';
import 'package:today/widgets/calendar.dart';
import 'package:today/widgets/collapsable_container.dart';

class TitleSection extends StatefulWidget {
  @override
  _TitleSectionState createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool _isCollapsed = false;

  void collapse() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          CollapsableContainer(
            child: Calendar(),
            expand: _isCollapsed,
          ),
          GestureDetector(
            onVerticalDragDown: (details) {
              collapse();
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TypewriterAnimatedTextKit(
                  totalRepeatCount: 1,
                  repeatForever: true,
                  speed: Duration(seconds: 1),
                  text: ['선화의 하루'],
                  textStyle: TextStyle(
                    fontSize: 40,
                    fontFamily: "GamjaFlower",
                    color: kScreenTitleColor,
                  ),
                ),
//                Text(
//                  "선화의 하루",
//                  textAlign: TextAlign.start,
//                  style: TextStyle(
//                    fontSize: 40,
//                    fontFamily: "GamjaFlower",
//                    color: kScreenTitleColor,
//                  ),
//                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

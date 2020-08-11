import 'package:flutter/material.dart';
import 'package:today/utils/constants.dart';

class PickerButton extends StatelessWidget {
  final Icon leadingIcon;
  final Function onPressed;
  final String inside_text;

  PickerButton({Key key, this.leadingIcon, this.onPressed, this.inside_text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kNewTaskButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: Row(
          children: [
            leadingIcon,
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                inside_text,
                style: TextStyle(
                  fontFamily: "GamjaFlower",
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}

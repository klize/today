import 'package:flutter/material.dart';
import 'package:today/utils/constants.dart';

class PickerButton extends StatelessWidget {
  final Icon leadingIcon;
  final Function onPressed;
  final String innerText;

  PickerButton({
    this.leadingIcon,
    this.onPressed,
    this.innerText,
  });

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
                innerText,
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

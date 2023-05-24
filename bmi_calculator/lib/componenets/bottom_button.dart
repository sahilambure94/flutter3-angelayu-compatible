import '../constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.onTap, required this.buttonTitle});
  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtontextStyle,
          ),
        ),
        color: kBottomBttnColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 5),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

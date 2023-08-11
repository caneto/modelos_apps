import 'package:flutter/material.dart';
import 'package:learnkuy/utils/typography.dart';

class PrimaryTextButton extends StatelessWidget {
  PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.title,required this.textStyle
  });
  final Function() onPressed;
  final String title;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}

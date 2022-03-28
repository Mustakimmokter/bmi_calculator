import 'package:bmi_calculator_last/constants.dart';
import 'package:flutter/material.dart';

class MaleAndFemale extends StatelessWidget {
  final String text;
  final IconData? iconData;
  const MaleAndFemale({
    Key? key,
    this.text = 'Content here',
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 60,
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: cTextStyleOne,
        ),
      ],
    );
  }
}

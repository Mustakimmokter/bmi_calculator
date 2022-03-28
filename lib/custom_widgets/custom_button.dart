import 'package:bmi_calculator_last/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const CustomButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 80,
          color: Colors.pink,
          child: Text(
            text!,
            style: cTextStyleOne.copyWith(
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

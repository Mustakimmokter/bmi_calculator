import 'package:bmi_calculator_last/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final Function()? onTap;
  const CustomCard({
    Key? key,
    this.color = cActiveCardColor,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10),
          child: child,
          decoration: BoxDecoration(
            color: color,
            // Color(0xFF0C0E1A),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

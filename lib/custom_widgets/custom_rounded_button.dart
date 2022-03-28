import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final IconData? iconData;
  final Function()? onPressed;
  const CustomRoundedButton({Key? key, this.iconData, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(8.0),
      constraints: BoxConstraints.tightFor(),
      onPressed: onPressed,
      child: Icon(iconData, color: Colors.white, size: 30),
      fillColor: Colors.grey.withOpacity(.30),
      shape: CircleBorder(),
    );
  }
}

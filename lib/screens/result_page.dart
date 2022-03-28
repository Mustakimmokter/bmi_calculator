import 'package:bmi_calculator_last/constants.dart';
import 'package:bmi_calculator_last/custom_widgets/custom_button.dart';
import 'package:bmi_calculator_last/custom_widgets/custom_card.dart';
import 'package:bmi_calculator_last/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  final String? bmiResult, bmiTextResult, bmiMassageText;
  const ResultPage(
      {Key? key, this.bmiResult, this.bmiMassageText, this.bmiTextResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void getLocation() async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    }

    Future<Position?> determinePosition() async {
      await Geolocator.checkPermission();
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error('Location Not Available');
        }
      } else {
        throw Exception('Error');
      }
      return await Geolocator.getCurrentPosition();
    }

    return Scaffold(
      backgroundColor: Color(0xFF0A0A11),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0A11),
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 10, bottom: 20),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: cTextStyleThree),
            ),
            CustomCard(
              color: cInActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiTextResult!, style: cTextStyleFour),
                  Text(bmiResult!, style: cTextStyleTwo),
                  Text(bmiMassageText!,
                      textAlign: TextAlign.center, style: cTextStyleFive),
                ],
              ),
            ),
            SizedBox(height: 10),
            Consumer<StateManagement>(
              builder: (context, stateManage, child) {
                return CustomButton(
                  text: 'RECALCULATE',
                  onPressed: () {
                    Navigator.pop(context);
                    determinePosition();
                    getLocation();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bmi_calculator_last/constants.dart';
import 'package:bmi_calculator_last/custom_widgets/animated_navigate.dart';
import 'package:bmi_calculator_last/custom_widgets/custom_button.dart';
import 'package:bmi_calculator_last/custom_widgets/male_and_female.dart';
import 'package:bmi_calculator_last/model/calculate_brain.dart';
import 'package:bmi_calculator_last/screens/result_page.dart';
import 'package:bmi_calculator_last/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_card.dart';
import '../custom_widgets/custom_rounded_button.dart';

class AnalysisPage extends StatelessWidget {
  static const String pageRoute = 'AnalysisPage';
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x0E141FFF),
      appBar: AppBar(
        backgroundColor: Color(0x0E141FFF),
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            // Male and Female
            Expanded(
              child: Consumer<StateManagement>(
                builder: (context, stateManage, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        onTap: () {
                          stateManage.getMaleFemale(true);
                        },
                        color: stateManage.maleFemale == true
                            ? cActiveCardColor
                            : cInActiveCardColor,
                        child: MaleAndFemale(
                          iconData: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                      CustomCard(
                        onTap: () {
                          stateManage.getMaleFemale(false);
                        },
                        color: stateManage.maleFemale == false
                            ? cActiveCardColor
                            : cInActiveCardColor,
                        child: MaleAndFemale(
                          iconData: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Height
            CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: cTextStyleOne),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Consumer<StateManagement>(
                        builder: (context, stateManage, child) {
                          return Text(
                            stateManage.height.toString(),
                            style: cTextStyleTwo,
                          );
                        },
                      ),
                      Text(
                        'cm',
                        style: cTextStyleOne,
                      ),
                    ],
                  ),
                  Consumer<StateManagement>(
                    builder: (context, stateManage, child) {
                      return SliderTheme(
                        data: SliderThemeData(
                          thumbColor: Colors.pink,
                          activeTrackColor: Colors.white,
                          overlayColor: Colors.pink.withOpacity(.15),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 25,
                          ),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                          ),
                        ),
                        child: Slider(
                          min: 120,
                          max: 200,
                          inactiveColor: Colors.grey,
                          value: stateManage.height.toDouble(),
                          onChanged: (value) {
                            stateManage.getIncreaseDecrease(
                                'height', value.toInt());
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            // Weight
            Expanded(
              child: Consumer<StateManagement>(
                builder: (context, stateManage, child) {
                  return Row(
                    children: [
                      CustomCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: cTextStyleOne),
                            Text(stateManage.weight.toString(),
                                style: cTextStyleTwo),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomRoundedButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    stateManage.getIncreaseDecrease(
                                        '+weight', 0);
                                  },
                                ),
                                CustomRoundedButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    stateManage.getIncreaseDecrease(
                                        '-weight', 0);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: cTextStyleOne),
                            Text(stateManage.age.toString(),
                                style: cTextStyleTwo),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomRoundedButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    stateManage.getIncreaseDecrease('+age', 0);
                                  },
                                ),
                                CustomRoundedButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    stateManage.getIncreaseDecrease('-age', 0);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Bottom button
            Consumer<StateManagement>(
              builder: (context, stateManage, child) {
                return CustomButton(
                  text: 'CALCULATE',
                  onPressed: () {
                    CalculateBrain clc = CalculateBrain(
                        weight: stateManage.weight, height: stateManage.height);
                    Navigator.of(context).push(animatedPageRoute(ResultPage(
                      bmiResult: clc.bmiCalculate(),
                      bmiTextResult: clc.getBMIResult(),
                      bmiMassageText: clc.getBMIMassage(),
                    )));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

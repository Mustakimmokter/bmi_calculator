import 'package:bmi_calculator_last/screens/analysis_page.dart';
import 'package:bmi_calculator_last/state_management/state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateManagement>(
      create: (_) => StateManagement(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: AnalysisPage.pageRoute,
        routes: {
          AnalysisPage.pageRoute: (_) => AnalysisPage(),
        },
      ),
    );
  }
}

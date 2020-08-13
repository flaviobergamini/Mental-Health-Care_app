import 'package:MentalHealthCare/control/home_page.dart';
import 'package:flutter/material.dart';

import 'control/app_builder.dart';
import 'view/info_meditacao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mental Health Care',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: InfoMeditacao(),
      home: HomePage(),
    );
    });
  }
}

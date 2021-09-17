import 'package:flutter/material.dart';
import 'package:my_school_app/pages/Auth_screen.dart';

import 'package:my_school_app/pages/calendar2.dart';
import 'package:my_school_app/pages/student/student_view.dart';
import 'helpers/colors.dart';
import 'pages/home.dart';
import 'helpers/strings.dart';
import 'package:my_school_app/pages/onBoarding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget titleSection = Container(
    child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Strings.appTitle,
                  style: TextStyle(
                      color: Colors.black54,

                      fontWeight: FontWeight.bold,

                      fontSize: 30.0)))
        ]),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: new Color(0xffEFD4CD),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white38,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(
              vertical: defaultPadding * 1.2, horizontal: defaultPadding),
        ),
      ),
      home:Home()
    );
  }
}



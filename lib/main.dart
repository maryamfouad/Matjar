import 'package:dna_graduation/UI/Screens/Authentication/SignUp.dart';
import 'package:dna_graduation/UI/Screens/BNB.dart';
import 'package:dna_graduation/UI/Screens/SplashScreen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: "/",
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}


import 'package:dna_graduation/UI/Screens/BNB.dart';
import 'package:dna_graduation/UI/Screens/Onboarding/OnboardingModels.dart';
import 'package:dna_graduation/UI/Screens/Onboarding/OnboardingScreens.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/Screens/HomePage/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        "images/dnaLogo.png",
        fit: BoxFit.cover,
      ),

      backgroundColor: Colors.white,
      showLoader: false,
      //loadingText: Text("Loading..."),
      navigator: onBoarding(),
      durationInSeconds: 2,
    );
  }
}

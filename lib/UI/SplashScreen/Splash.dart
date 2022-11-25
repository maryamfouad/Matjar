import 'package:dna_graduation/UI/buyerScreens/BNB.dart';
import 'package:dna_graduation/UI/buyerScreens/Onboarding/OnboardingScreens.dart';
import 'package:dna_graduation/UI/sellerScreens/sellerbnbtest.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var seenBoard;
  var isShop;
  @override
  void initState() {
    seenBoard = userSharedPrefs.getBoarding() ?? false;
    isShop = userSharedPrefs.getIsShop() ?? false;
    print(isShop);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (seenBoard == true) {
      if (isShop == 'true') {
        return EasySplashScreen(
          logo: Image.asset(
            "images/dnaLogo.png",
            fit: BoxFit.cover,
          ),

          backgroundColor: Colors.white,
          showLoader: false,
          //loadingText: Text("Loading..."),
          navigator: sellerbnbtest(),
          durationInSeconds: 2,
        );
      } else {
        return EasySplashScreen(
          logo: Image.asset(
            "images/dnaLogo.png",
            fit: BoxFit.cover,
          ),

          backgroundColor: Colors.white,
          showLoader: false,
          //loadingText: Text("Loading..."),
          navigator: BNB(),
          durationInSeconds: 2,
        );
      }
    } else {
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
}

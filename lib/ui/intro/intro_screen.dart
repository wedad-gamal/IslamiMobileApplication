import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/constants/shared_preferences_constant.dart';
import 'package:islami_application/ui/home/home_screen.dart';
import 'package:islami_application/ui/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "intro";
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 6000), () {
      _isFirstTime().then((value) {
        if (value) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              "assets/images/islami_logo.png",
              width: width * 0.4,
            ).zoomIn(duration: Duration(milliseconds: 600)),
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/mosque.png", width: width * 0.8),
                  Image.asset("assets/images/branding.png", width: width * 0.5),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: width * 0.03,
            child: Image.asset("assets/images/glow.png").fadeInDown(),
          ),
          Positioned(
            left: 0,
            top: height * 0.2,
            child: Image.asset("assets/images/shape-left.png").fadeInLeft(),
          ),
          Positioned(
            right: 0,
            bottom: height * 0.2,
            child: Image.asset("assets/images/shape-right.png").fadeInRight(),
          ),
        ],
      ),
    );
  }

  Future<bool> _isFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstTime =  sharedPreferences.getBool(SharedPreferencesConstant.isFirstTime.value) ?? false;
    return isFirstTime;
  }
}

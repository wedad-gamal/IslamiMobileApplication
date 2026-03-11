import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:islami_application/constants/shared_preferences_constant.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/home_screen.dart';
import 'package:islami_application/ui/onboarding/widgets/build_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboardingScreen";
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/images/logo.png")],
            ),

            // 2. Sliding Content
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  currentIndex = index;
                  isLastPage = index == 4;

                  setState(() {

                  });
                },
                children: [
                  BuildPage(
                    image: 'assets/images/onboarding_1.png',
                    title: 'Welcome To Islmi App',
                    subtitle: '',
                  ),
                  BuildPage(
                    image: 'assets/images/onboarding_2.png',
                    title: 'Welcome To Islami',
                    subtitle:
                        'We Are Very Excited To Have You In Our Community',
                  ),
                  BuildPage(
                    image: 'assets/images/onboarding_3.png',
                    title: 'Reading the Quran',
                    subtitle:
                    'Read, and your Lord is the Most Generous',
                  ),
                  BuildPage(
                    image: 'assets/images/onboarding_4.png',
                    title: 'Bearish',
                    subtitle:
                    'Praise the name of your Lord, the Most High',
                  ),
                  BuildPage(
                    image: 'assets/images/onboarding_5.png',
                    title: 'Holy Quran Radio',
                    subtitle:
                    'You can listen to the Holy Quran Radio through the application for free and easily',
                  ),
                ],
              ),
            ),

            // 3. Bottom Navigation
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(
                    width: 60,
                    child: currentIndex == 0? null:TextButton(
                      onPressed: () =>
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          ),
                      child: Text(
                        "Back", style: TextStyles.labelSmallStyle(
                          color: AppColors.gold, fontSize: 16),
                      ),
                    ),
                  ),

                  // Indicators
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.gold,
                      dotColor: Colors.grey,
                      dotHeight: 8,
                      dotWidth: 6,
                    ),
                  ),

                  // Next Button
                  TextButton(
                    onPressed: () {
                      if(isLastPage) {
                        _saveFirstTime();
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }

                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );

                    },
                    child: Text(
                      isLastPage?"Finish":"Next", style: TextStyles.labelSmallStyle(color: AppColors.gold, fontSize: 16),

                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Future<void> _saveFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(SharedPreferencesConstant.isFirstTime.value, true);
  }
}

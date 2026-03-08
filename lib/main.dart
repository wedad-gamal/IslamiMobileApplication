import 'package:flutter/material.dart';
import 'package:islami_application/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_application/ui/home/home_screen.dart';
import 'package:islami_application/ui/home/tabs/hadeth_tab/models/hadeth.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_application/ui/intro/intro_screen.dart';
import 'package:islami_application/ui/sura_details/sura_details_screen.dart';

void main(){
  runApp(IslamiApplication());
}

class IslamiApplication extends StatelessWidget {
  const IslamiApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        IntroScreen.routeName: (context) => IntroScreen(),
        SuraDetailsScreen.routeName: (context) {
          Sura sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetailsScreen(sura: sura);
        },
        HadethDetailsScreen.routeName : (context) {
          Hadeth hadeth= ModalRoute.of(context)?.settings.arguments as Hadeth;
          return HadethDetailsScreen(hadeth: hadeth);
        }
      },
      initialRoute: IntroScreen.routeName,
    );
  }
}

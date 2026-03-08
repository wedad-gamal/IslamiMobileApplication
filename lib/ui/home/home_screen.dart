import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islami_application/ui/home/tabs/quran_tab//quran_tab.dart';
import 'package:islami_application/ui/home/tabs/sebha_tab/sebha_tab.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.pink),
  ];
  late PageController pageController = PageController(initialPage: currentIndex);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      int index = pageController.page!.round();
      if(currentIndex == index) return;
      setState(() {
        currentIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(
        controller: pageController,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColors.gold,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyles.bodyMediumStyle(),
          showUnselectedLabels: false,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.black,
          currentIndex: currentIndex,
          onTap: (index){
            if(currentIndex == index) return;
            setState(() {
              currentIndex = index;
              pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
            });
          },
          items: [
        BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_quran.png", 0), label: "Quran"),
        BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_hadeth.png",1), label: "Hadeth"),
        BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_sebha.png",2), label: "Sebha"),
        BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_radio.png",3), label: "Radio"),
        BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_time.png",4), label: "Time"),
      ]
      ),
    );
  }
  Widget _buildBottomNavigationBarIcon(String imagePath, int index){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(66),
        color: currentIndex == index ? AppColors.black.withAlpha(60) : null
      ),
      child: ImageIcon(AssetImage(imagePath))
    );
  }
}

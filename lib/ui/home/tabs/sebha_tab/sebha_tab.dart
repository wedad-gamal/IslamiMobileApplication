import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/sebha_tab/models/sebha.dart';
import 'package:islami_application/ui/home/tabs/widgets/base_tab.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late int counter;
  int zakrIndex = 0;
  double turns = 0.0;
  PageController sebhaController = PageController();

  @override
  void initState() {
    super.initState();
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BaseTab(
      image: "assets/images/sebha_background.png",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/images/logo.png")],
            ),
          ),

          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: TextStyles.titleLargeStyle(),
          ),

          InkWell(
            onTap: () {
              setState(() {
                HapticFeedback.vibrate();
                counter++;
                // 2. Increment rotation (e.g., 1/33 of a circle per click)
                turns += 1 / 30;
                if (counter == 30) {
                  _changeZakr(zakrIndex);
                  sebhaController.animateToPage(
                    zakrIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              });
            },
            child: Container(
              padding: EdgeInsets.all(30),

              child: Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentGeometry.center,
                children: [
                  Positioned(
                    top: -75,
                    right: 115,
                    child: Image.asset(
                      "assets/images/sebha_head.png",
                      width: 70,
                    ),
                  ),
                  AnimatedRotation(
                    turns: turns,
                    duration: Duration(milliseconds: 200),
                    child: Image.asset("assets/images/sebha_body.png"),
                  ),
                  Column(
                    spacing: 20,
                    children: [
                      Container(
                        height: 100,
                        width: 250,
                        alignment: Alignment.bottomCenter,

                        child: PageView.builder(
                          controller: sebhaController,
                          scrollDirection: Axis.horizontal,
                          itemCount: sebhaList.length,
                          itemBuilder: (context, index) => Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              sebhaList[index].text,
                              textAlign: TextAlign.center,
                              style: TextStyles.bodyLargeStyle(fontSize: 36),
                            ),
                          ),
                        ),
                      ),

                      Text(
                        counter.toString(),
                        style: TextStyles.bodyLargeStyle(fontSize: 36),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 5),
        ],
      ),
    );
  }

  void _changeZakr(int value) {
    counter = 0;
    zakrIndex++;
    if (zakrIndex == sebhaList.length) {
      zakrIndex = 1;
    }

    debugPrint(zakrIndex.toString());
  }
}

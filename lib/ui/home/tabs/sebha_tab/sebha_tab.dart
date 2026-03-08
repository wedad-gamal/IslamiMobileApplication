import 'package:flutter/material.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/widgets/base_tab.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  late int counter;

  @override
  void initState() {
    super.initState();
    counter = 0;
  }
  @override
  Widget build(BuildContext context) {
    return BaseTab(image: "assets/images/sebha_background.png",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                ],
              ),
            ),
            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: TextStyles.titleLargeStyle()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: InkWell(
                onTap: (){
                  setState(() {
                    counter++;
                  });
                },
                child: Stack(
                  alignment: AlignmentGeometry.center,
                    children: [Image.asset("assets/images/sebha_shape.png"),
                     Column(
                       spacing: 20,
                       children: [
                         SizedBox(height: 40,),
                         Text("سبحان الله", style: TextStyles.bodyLargeStyle(fontSize: 36),),
                         Text(counter.toString(), style: TextStyles.bodyLargeStyle(fontSize: 36),),
                       ],
                     )

                    ]
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  counter = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.gold
                ),
                child: Icon(Icons.refresh, color: AppColors.white, size: 40),

              ),
            ),
            SizedBox(height: 50,)
          ],
        ) );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_application/ui/home/tabs/widgets/base_tab.dart';

import 'models/hadeth.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = List.filled(10, Hadeth(content: "", id: 0, title: ""));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {

    return BaseTab(
      image: "assets/images/hadeth_background.png",
      child: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CarouselSlider.builder(itemCount: hadethList.length,
                itemBuilder: (context, index, realIndex) => InkWell(
                  onTap: (){
                  Navigator.pushNamed(context, HadethDetailsScreen.routeName, arguments: hadethList[index]);
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          color: AppColors.gold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/images/hadeth_details/left_corner.png",),
                                Text(hadethList[index].title, style: TextStyles.titleSmallStyle(color: AppColors.black),),
                                Image.asset("assets/images/hadeth_details/right_corner.png",)
                              ],
                            ),
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(hadethList[index].content ?? "",
                                    style: TextStyles.bodyLargeStyle(color: AppColors.black),
                                    maxLines: 16,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                  ),
                                )

                            )
                          ],
                        ),
                      ),
                      Center(child: Image.asset("assets/images/hadeth_details_background.png", opacity:const AlwaysStoppedAnimation(.8),)),
                      Align(
                        alignment: AlignmentGeometry.bottomCenter,
                          child: Image.asset("assets/images/hadeth_details/mosque.png", width: double.infinity, fit: BoxFit.fitWidth,)),
                    ],
                  ),
                ),
                options: CarouselOptions(
              height: double.infinity,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            )),
          ))
        ],
      )
    );
  }

  Future<void> _loadData() async{
    String data = await rootBundle.loadString("assets/files/hadeeth.txt");
    List<String> ahadeth = data.split("#");
    for(int i=0; i< ahadeth.length; i++){
      var hadethSplited = ahadeth[i].trim().split("\n");
      var title = hadethSplited.first;
      var content = hadethSplited.sublist(1).join(" ");
      Hadeth hadeth = Hadeth(title: title, content: content, id: i);

      setState(() {
        hadethList[i] = hadeth;
      });
    }
  }
}

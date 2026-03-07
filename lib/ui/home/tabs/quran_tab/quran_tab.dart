import 'package:flutter/material.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/widgets/sura_row.dart';

class QuranTab extends StatelessWidget {

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset("assets/images/quran_tab/background.png", fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black,
                AppColors.black.withAlpha(70),
              ],
              begin: AlignmentGeometry.bottomCenter,
              end: AlignmentGeometry.topCenter
            )
          )
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/quran_tab/logo.png"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  style: TextStyles.labelMediumStyle(),
                  cursorColor: AppColors.gold,
                  decoration: InputDecoration(
                    fillColor: AppColors.black.withAlpha(60),
                    filled: true,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.gold
                      )
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.gold
                      )
                    ),

                    hintText: "Sura Name",
                    hintStyle: TextStyles.labelMediumStyle(),

                    prefixIcon: ImageIcon(AssetImage("assets/images/quran_tab/prefix_sura_name.png"), color: AppColors.gold,)
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20,),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Suras List", style: TextStyles.titleSmallStyle(),),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20,),
            ),
            SliverList.separated(
              itemCount: quranList.length,
              itemBuilder: (context, index) {

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SuraRow(sura: quranList[index]),
              );
            }, separatorBuilder: (context, index) => Divider(indent: 40, endIndent: 40,),)
          ]
        )
      ]
    );
  }

}

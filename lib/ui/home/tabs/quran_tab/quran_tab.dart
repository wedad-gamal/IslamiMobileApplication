import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:islami_application/constants/shared_preferences_constant.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/widgets/sura_row.dart';
import 'package:islami_application/ui/home/tabs/widgets/base_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<Sura> currentList = [];
  List<Sura> mostRecent = [];

  @override
  void initState() {
    _getMostRecentList();
    super.initState();
    for (int i = 0; i < quranList.length; i++) {
      currentList.add(quranList[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BaseTab(
      image: "assets/images/quran_background.png",
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/logo.png")],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: _search,
                style: TextStyles.labelMediumStyle(),
                cursorColor: AppColors.gold,
                decoration: InputDecoration(
                  fillColor: AppColors.black.withAlpha(60),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: AppColors.gold),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(width: 1, color: AppColors.gold),
                  ),

                  hintText: "Sura Name",
                  hintStyle: TextStyles.labelMediumStyle(),

                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/prefix_sura_name.png"),
                    color: AppColors.gold,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          if (currentList.length == 114) ...[
            if (mostRecent.isNotEmpty) ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Most Recent",
                    style: TextStyles.titleSmallStyle(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 160,
                  child: ListView.separated(
                    padding: EdgeInsets.all(20),
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: mostRecent.length,
                    itemBuilder: (context, index) {
                      return Container(

                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(mostRecent[index].nameEn, style: TextStyles.titleLargeStyle(color: AppColors.black),),
                                Text(mostRecent[index].nameAr, style: TextStyles.titleLargeStyle(color: AppColors.black),),
                                Text(mostRecent[index].versesNumber.toString(), style: TextStyles.titleSmallStyle(color: AppColors.black),),
                              ],),
                            Image.asset("assets/images/img_most_recent.png"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Suras List", style: TextStyles.titleSmallStyle()),
              ),
            ),
          ],
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverList.separated(
            itemCount: currentList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: SuraRow(
                  sura: currentList[index],
                  onTap: addToMostRecent,
                ),
              );
            },
            separatorBuilder: (context, index) =>
                Divider(indent: 40, endIndent: 40),
          ),
        ],
      ),
    );
  }

  void _search(String value) {
    currentList = quranList
        .where(
          (sura) =>
              sura.nameAr.toLowerCase().contains(value.toLowerCase()) ||
              sura.nameEn.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    setState(() {});
  }

  Future<void> _getMostRecentList() async {
    mostRecent = [];

    SharedPreferences sharedPreference = await SharedPreferences.getInstance();

    List<String>? mostRecentList =
        await sharedPreference.getStringList(
          SharedPreferencesConstant.mostRecent.value,
        ) ??
        [];
    for (var element in mostRecentList) {
      var id = int.parse(element);
      mostRecent.add(quranList[id - 1]);
    }
    setState(() {});

  }

  Future<void> addToMostRecent(Sura sura) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    List<String>? mostRecentList =
        await sharedPreference.getStringList(
          SharedPreferencesConstant.mostRecent.value,
        ) ??
        [];

    mostRecentList.removeWhere((element) => element == sura.id.toString());

    mostRecentList = [sura.id.toString(), ...mostRecentList];

    await sharedPreference.setStringList(
      SharedPreferencesConstant.mostRecent.value,
      mostRecentList,
    );

    _getMostRecentList();
  }
}

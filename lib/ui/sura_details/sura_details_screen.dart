import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/models/sura.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "/SuraDetailsScreen";
  final Sura sura;
  const SuraDetailsScreen({required this.sura, super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String? suraContent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSuraDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(widget.sura.nameEn, textAlign: TextAlign.center),
      ),
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/mosque_gold.png",
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/img_left_corner.png",
                    ),
                    Text(
                      widget.sura.nameAr,
                      style: TextStyles.titleLargeStyle(color: AppColors.gold),
                    ),
                    Image.asset(
                      "assets/images/img_right_corner.png",
                    ),
                  ],
                ),
              ),
              suraContent == null? CircularProgressIndicator(
                color: AppColors.gold,
              ) :Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    suraContent ??"",
                    style: TextStyles.bodyMediumStyle(color: AppColors.gold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _getSuraDetails() async {
    await Future.delayed(Duration(seconds: 2));
    var suraDetailsText = await rootBundle.loadString(
      "assets/files/${widget.sura.id}.txt",
    );
    var ayatList = suraDetailsText
        .trim()
        .split("\n")
        .map((e) => e.trim())
        .toList();
    suraDetailsText = "";
    for(int i=0; i< ayatList.length;i++){
      suraDetailsText += "${ayatList[i]} [${i+1}] ";
    }
    setState(() {
      suraContent = suraDetailsText;
    });
  }
}

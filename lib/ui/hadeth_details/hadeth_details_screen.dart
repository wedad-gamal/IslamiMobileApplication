import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';
import 'package:islami_application/ui/home/tabs/hadeth_tab/models/hadeth.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "/hadethDetailsScreen";
  final Hadeth hadeth;
  const HadethDetailsScreen({required this.hadeth, super.key});

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        title: Text(widget.hadeth.title, textAlign: TextAlign.center),
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
                      widget.hadeth.title,
                      style: TextStyles.titleLargeStyle(color: AppColors.gold),
                    ),
                    Image.asset(
                      "assets/images/img_right_corner.png",
                    ),
                  ],
                ),
              ),
              widget.hadeth.content == null? CircularProgressIndicator(
                color: AppColors.gold,
              ) :Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    widget.hadeth.content ?? "",
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

}

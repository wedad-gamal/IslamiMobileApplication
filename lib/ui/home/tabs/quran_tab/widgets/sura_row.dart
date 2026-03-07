import 'package:flutter/material.dart';
import 'package:islami_application/ui/home/tabs/quran_tab/models/sura.dart';
import 'package:islami_application/ui/sura_details/sura_details_screen.dart';

import '../../../../../theme/text_styles.dart';

class SuraRow extends StatelessWidget {
  final Sura sura;
  const SuraRow({required this.sura,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName, arguments: sura);

      },
      child: Row(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              Image.asset("assets/images/quran_tab/sura_shape.png", height: 53),
              Text("${sura.id}", style: TextStyles.titleSmallStyle(),)
            ],
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(sura.nameEn, style: TextStyles.titleMediumStyle(),),
                Text("${sura.versesNumber} verses", style: TextStyles.titleSmallStyle(),)
              ],
            ),
          ),
          Text(sura.nameAr, style: TextStyles.titleMediumStyle(),)
        ],
      ),
    );
  }
}

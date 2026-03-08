import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class BaseTab extends StatelessWidget {
  final String image;
  final Widget child;

  const BaseTab({super.key, required this.image, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover, width: double.infinity, height: double.infinity,),

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
        child
      ],
    );
  }
}

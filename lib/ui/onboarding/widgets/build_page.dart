import 'package:flutter/material.dart';
import 'package:islami_application/theme/colors.dart';
import 'package:islami_application/theme/text_styles.dart';

class BuildPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const BuildPage({super.key, required this.image, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(image),
        ),
        const SizedBox(height: 40),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.titleLargeStyle(color: AppColors.gold),
        ),
        if (subtitle!.isNotEmpty) ...[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyles.titleSmallStyle(color: AppColors.gold),
            ),
          ),
        ],
      ],
    );
  }
}

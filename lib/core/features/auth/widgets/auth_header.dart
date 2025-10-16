import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        Image.asset(
          AppImages.headerCards,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}

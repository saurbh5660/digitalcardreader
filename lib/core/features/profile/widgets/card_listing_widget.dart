import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_colors.dart';
import '../../home/widgets/home_card.dart';

class CardListingWidget extends GetView<ProfileController> {
  const CardListingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: AppColors.accent),
          ),
          child: Row(
            children: ["Collections", "Cards", "Listings"].indexed
                .map(
                  (e) => Expanded(
                    child: GestureDetector(
                      onTap: () => controller.onChangeIndex(e.$1),
                      child: Obx(() {
                        final isSelected =
                            e.$1 == controller.selectedIndex.value;
                        return Container(
                          // margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            e.$2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: isSelected
                                  ? AppColors.black
                                  : AppColors.textGrey,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Obx(() {
          final cardList = controller.cardList.value;
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 20, bottom: 60),
            physics: NeverScrollableScrollPhysics(),
            itemCount: cardList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 9 / 16,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => HomeCard(card: cardList[index]),
          );
        }),
      ],
    );
  }
}

import 'package:digital_card_grader/core/features/profile/controllers/view_profile_controller.dart';
import 'package:digital_card_grader/core/features/profile/widgets/card_widget.dart';
import 'package:digital_card_grader/core/features/profile/widgets/market_widget.dart';
import 'package:digital_card_grader/core/models/card_list_response.dart';
import 'package:digital_card_grader/core/models/marketplace_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_colors.dart';
import '../../../models/collection_response.dart';
import 'collection_card_widget.dart';

class OtherCardListingWidget extends GetView<ViewProfileController> {
  OtherCardListingWidget({super.key});
  final profileController = Get.find<ViewProfileController>();

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
          if (controller.isCurrentListEmpty) {
            return Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                getEmptyMessage(controller.selectedIndex.value),
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 20, bottom: 60),
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.currentList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: getAspectRatio(controller.selectedIndex.value),
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = controller.currentList[index];
              switch (controller.selectedIndex.value) {
                case 0: // Collections
                  return CollectionCard(collection: item as CollectionBody);
                case 1: // Cards
                  return CardWidget(cardList: item as CardList);
                case 2: // Listings
                  return MarketWidget(cardList: item as MarketList);

                default:
                  return Container();
              }
            },
          );
        }),
      ],
    );
  }

  String getEmptyMessage(int index) {
    switch (index) {
      case 0:
        return 'No collections found';
      case 1:
        return 'No cards found';
      case 2:
        return 'No listings found';
      default:
        return 'No data found';
    }
  }

  double getAspectRatio(int index) {
    switch (index) {
      case 0: // Collections - you might want different aspect ratio
        return 9 / 14;
      case 1: // Cards
        return 9 / 14;
      case 2: // Listings
        return 9 / 14;
      default:
        return 9 / 14;
    }
  }
}
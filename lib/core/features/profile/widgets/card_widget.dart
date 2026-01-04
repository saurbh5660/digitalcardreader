import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/models/card_list_response.dart';
import 'package:digital_card_grader/network/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../common/apputills.dart';
import '../../../constants/app_routes.dart';
import '../../../models/marketplace_response.dart';
import '../controllers/profile_controller.dart';

class CardWidget extends StatelessWidget {
  final CardList cardList;
  final bool canOpenProfile;
  final bool isMyProfile;

  const CardWidget({
    super.key,
    required this.cardList,
    this.canOpenProfile = false,
    this.isMyProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final marketItem = MarketList.fromCard(cardList);

        Get.toNamed(
          AppRoutes.cardDetail,
          arguments: {
            'cardList': marketItem,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(27),
        ),
        color: AppColors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textGrey.withAlpha(80),
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 0.80,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        /// BORDER PNG - ALWAYS visible & fills entire card
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Positioned.fill(
                            child: Image.asset(
                              Utils.getBorderImage(
                                cardList.overall ?? 0.0,
                                cardList.hasLimited ?? 0,
                              ),
                              // Utils.getBorderImage(8.25),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        /// CARD IMAGE - placed inside the border window
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 44.0),
                            child: FractionallySizedBox(
                              widthFactor: 0.72,
                              heightFactor: 0.76,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  ApiConstants.userImageUrl +
                                      (cardList.imagePath ?? ''),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 31,
                          right: 32,
                          child: Text(
                            (cardList.overall ?? '0.0').toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 7,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            /*  Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(27),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textGrey.withAlpha(80),
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: cardList.imagePath != null
                      ? Image.network(
                    ApiConstants.userImageUrl + cardList.imagePath!,
                    fit: BoxFit.cover,
                    width: double.infinity, // Ensure full width
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.card,
                        width: double.infinity,
                        child: Icon(
                          Icons.collections,
                          size: 40,
                          color: AppColors.textGrey,
                        ),
                      );
                    },
                  )
                      : Container(
                    color: AppColors.card,
                    width: double.infinity,
                    child: Icon(
                      Icons.collections,
                      size: 40,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cardList.cardName ?? "Unnamed Collection",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      if (isMyProfile) ...{
                        Obx(() {
                          final controller = Get.find<ProfileController>();
                          final packs =
                              controller.profile.value.packBuyList ?? [];
                          if (packs.isNotEmpty) {
                            return GestureDetector(
                              onTap: () => controller.showPackSelectionDialog(
                                context,
                                packs,
                                cardList.id.toString(),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.black,
                                  shape: BoxShape.circle,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.stars,
                                  color: Colors.amber,
                                  size: 22,
                                ),
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        }),
                      },
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          // 'Card',
                          cardList.user?.name ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textGrey,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      GestureDetector(
                        onTap: () {
                          /* if (canOpenProfile) {
                            Get.toNamed(AppRoutes.viewProfile);
                          }*/
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(62),
                          child: Image.network(
                            ApiConstants.userImageUrl +
                                (cardList.user?.profilePicture ?? ''),
                            width: 28,
                            height: 28,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Assets.imagesImagePlaceholder,
                                width: 28,
                                height: 28,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

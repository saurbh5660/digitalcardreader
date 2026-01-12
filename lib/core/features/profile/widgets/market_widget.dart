import 'package:digital_card_grader/core/common/apputills.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/models/marketplace_response.dart';
import 'package:digital_card_grader/network/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../common/db_helper.dart';
import '../../../constants/app_routes.dart';

class MarketWidget extends StatelessWidget {
  final MarketList cardList;
  final bool canOpenProfile;

  const MarketWidget({super.key, required this.cardList, this.canOpenProfile = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.cardDetail, arguments: {'cardList': cardList});
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        color: AppColors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:
                  AspectRatio(
                    aspectRatio: 0.80,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        /// BORDER PNG - ALWAYS visible & fills entire card
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              Utils.getBorderImage(cardList.userCard?.overall ?? 0.0,cardList.userCard?.hasLimited ?? 0),
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
                                  ApiConstants.userImageUrl + (cardList.userCard?.imagePath ?? ''),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 27,
                          right: 30,
                          child: Text(
                            (cardList.userCard?.overall ?? '0.0').toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cardList.userCard?.cardName ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        "\$${cardList.price ?? 0}",
                        style: TextStyle(
                          color: AppColors.swatch,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.lato().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
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
                          if(cardList.user?.id.toString() != DbHelper().getUserModel()?.id.toString()){
                          Get.toNamed(AppRoutes.viewProfile,arguments: {"id":cardList.user?.id.toString()});
                          }
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
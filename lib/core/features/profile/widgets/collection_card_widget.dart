import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/network/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../constants/app_routes.dart';
import '../../../models/collection_response.dart';

class CollectionCard extends StatelessWidget {
  final CollectionBody collection;
  final bool canOpenProfile;

  const CollectionCard({
    super.key,
    required this.collection,
    this.canOpenProfile = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation to collection detail if needed
        Get.toNamed(AppRoutes.collectionCardScreen, arguments: {"id": collection.id.toString(),"userId":collection.userId.toString()});
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
                  child: collection.imagePath != null
                      ? Image.network(
                          ApiConstants.userImageUrl + collection.imagePath!,
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
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          collection.cardName ?? "Unnamed Collection",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      // You can add price or card count here if available
                      /*Text(
                        "${collection.totalCards ?? 0} cards",
                        style: TextStyle(
                          color: AppColors.swatch,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.lato().fontFamily,
                        ),
                      ),*/
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          collection.user?.name ?? '',
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
                                (collection.user?.profilePicture ?? ''),
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

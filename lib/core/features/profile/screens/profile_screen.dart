import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/profile/controllers/profile_controller.dart';
import 'package:digital_card_grader/core/features/profile/widgets/card_listing_widget.dart';
import 'package:digital_card_grader/generated/assets.dart';
import 'package:digital_card_grader/network/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: "",
        child: ListTile(
          title: Text(
            "Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          subtitle: GestureDetector(
            onTap: () async{
             final result = await Get.toNamed(AppRoutes.editProfile);
             if(result != null){
               controller.getProfile();
             }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Edit Profile",
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.edit, size: 15),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: IconButton(
              onPressed: () => Get.toNamed(AppRoutes.setting),
              icon: Icon(
                CupertinoIcons.settings,
                color: AppColors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 62),
                  padding: EdgeInsets.only(
                    top: 82,
                    left: 5,
                    right: 5,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textGrey.withAlpha(50),
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {},
                      //       style: TextButton.styleFrom(
                      //         foregroundColor: AppColors.white,
                      //         backgroundColor: AppColors.swatch,
                      //         padding: EdgeInsets.symmetric(horizontal: 25),
                      //         visualDensity: VisualDensity.compact,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5),
                      //         ),
                      //       ),
                      //       child: Text("Follow"),
                      //     ),
                      //     SizedBox(width: 10),
                      //     TextButton(
                      //       onPressed: () {},
                      //       style: TextButton.styleFrom(
                      //         foregroundColor: AppColors.white,
                      //         backgroundColor: AppColors.black,
                      //         padding: EdgeInsets.symmetric(horizontal: 18),
                      //         visualDensity: VisualDensity.compact,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5),
                      //         ),
                      //       ),
                      //       child: Text("Message"),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "2K",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Friends",
                                  style: TextStyle(
                                    color: AppColors.textGrey,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Obx(() {
                                    return Text(
                                      (controller.collectionList.isEmpty ? '0' : controller.collectionList.length.toString()),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily:
                                            GoogleFonts.openSans().fontFamily,
                                      ),
                                    );
                                  }
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Collection",
                                  style: TextStyle(
                                    color: AppColors.textGrey,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Obx(() {
                                    return Text(
                                      (controller.cardList.isEmpty ? '0' : controller.cardList.length.toString()),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        fontFamily:
                                            GoogleFonts.openSans().fontFamily,
                                      ),
                                    );
                                  }
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Cards",
                                  style: TextStyle(
                                    color: AppColors.textGrey,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Obx(() {
                          return Text(
                            controller.profile.value.name ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                            ),
                          );
                        }
                      ),
                     /* Text(
                        "San Francisco, USA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                        ),
                      ),*/
                      SizedBox(height: 20),
                      Divider(
                        color: AppColors.textGrey.withAlpha(100),
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20),
                      Obx(() {
                          return Text(
                            controller.profile.value.bio ?? '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textGrey,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 20),
                      CardListingWidget(),
                    ],
                  ),
                ),
                Obx(() {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(62),
                      child: Image.network(
                        ApiConstants.userImageUrl+(controller.profile.value.profilePicture ?? ''),
                        width: 124,
                        height: 124,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            Assets.imagesImagePlaceholder,
                              width: 124,
                              height: 124,
                              fit: BoxFit.cover,
                          );
                        },
                      ),
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: OvalBorder(),
        onPressed: () {
          switch (controller.selectedIndex.value) {
            case 0:
              Get.toNamed(AppRoutes.addCollection);
            case 1:
              Get.toNamed(AppRoutes.addCardDetail);
            case 2:
              Get.toNamed(AppRoutes.listCard);
          }
        },
        backgroundColor: AppColors.accent,
        child: Icon(Icons.add, size: 40, color: AppColors.white),
      ),
    );
  }
}

import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:digital_card_grader/core/constants/app_images.dart';
import 'package:digital_card_grader/core/features/profile/controllers/view_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/widgets/home_card.dart';

class ViewProfileScreen extends GetView<ViewProfileController> {
  const ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Profile"),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.white,
                              backgroundColor: AppColors.swatch,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: controller.onMessageSeller,
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.white,
                              backgroundColor: AppColors.black,
                              padding: EdgeInsets.symmetric(horizontal: 18),
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              "Message",
                              style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                  ),
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
                                Text(
                                  "89",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                  ),
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
                      Text(
                        "Michael Jordan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                        ),
                      ),
                      Text(
                        "San Francisco, USA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        color: AppColors.textGrey.withAlpha(100),
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "I enjoy trading cards and collecting them. Check out my collection!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textGrey,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),

                            decoration: BoxDecoration(
                              color: AppColors.card,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: AppColors.accent),
                            ),
                            child: Row(
                              children: ["Collections", "Cards", "Listings"]
                                  .indexed
                                  .map(
                                    (e) => Expanded(
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.onChangeIndex(e.$1),
                                        child: Obx(() {
                                          final isSelected =
                                              e.$1 ==
                                              controller.selectedIndex.value;
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? AppColors.white
                                                  : AppColors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                                                fontFamily: GoogleFonts.lato()
                                                    .fontFamily,
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 9 / 16,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 10,
                                  ),
                              itemBuilder: (context, index) =>
                                  HomeCard(card: cardList[index]),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 62,
                  backgroundImage: AssetImage(AppImages.profile),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:digital_card_grader/core/common/db_helper.dart';
import 'package:digital_card_grader/core/features/dashboard/controllers/dashboard_controller.dart';
import 'package:digital_card_grader/core/features/home/controllers/home_controller.dart';
import 'package:digital_card_grader/core/features/profile/widgets/market_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../generated/assets.dart';
import '../../../../network/api_constants.dart';
import '../../../common/common_textfield.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../../constants/app_routes.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child:   Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Marketplace",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.profile),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(62),
                          child: Image.network(
                            ApiConstants.userImageUrl +
                                (DbHelper().getUserModel()?.profilePicture ??
                                    ''),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Assets.imagesImagePlaceholder,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Logger().d("dsdsfdsdsgg");
                      final dashboardController = Get.find<DashboardController>();
                      dashboardController.onChangeIndex(1);
                    },
                    child: AbsorbPointer(
                      child: CommonTextfield(
                        "Type",
                        showTitle: false,
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.textGrey.withAlpha(80),
                        ),
                        readOnly: true,
                        focusNode: controller.inputFocus,
                        style: TextStyle(fontSize: 14),
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppColors.textGrey,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 8),
                          child: ImageIcon(AssetImage(AppIcons.search)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      "Cards For Sale",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Obx(() {
                    return SliverGrid.builder(
                      itemCount: controller.marketList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 16,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => MarketWidget(
                        cardList: controller.marketList[index],
                        canOpenProfile: true,
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

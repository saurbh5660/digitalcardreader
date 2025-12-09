import 'package:digital_card_grader/core/features/browse/controllers/browse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/common_textfield.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';
import '../../profile/widgets/market_widget.dart';

class BrowseScreen extends GetView<BrowseController> {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Browse",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  CommonTextfield(
                    "Type",
                    onChange: (query) => controller.onSearchChanged(query),
                    showTitle: false,
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.textGrey.withAlpha(80),
                    ),
                    // focusNode: controller.inputFocus,
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

                ],
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                 /* SliverToBoxAdapter(
                    child: Text(
                      "Cards For Sale",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),*/
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

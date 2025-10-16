import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/features/browse/controllers/browse_controller.dart';
import 'package:digital_card_grader/core/features/browse/widgets/browse_appbar.dart';
import 'package:digital_card_grader/core/features/home/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseScreen extends GetView<BrowseController> {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BrowseAppbar(),
          Obx(() {
            if (controller.isSearching.value) {
              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemBuilder: (context, index) {
                    final history = controller.searchHistory.value[index];
                    return GestureDetector(
                      onTap: () => controller.isSearching.value = false,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(history),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: controller.searchHistory.value.length,
                ),
              );
            }
            return Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        "Recent Card Grades",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Obx(() {
                      final cardList = controller.cardList.value;
                      return SliverGrid.builder(
                        itemCount: cardList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 9 / 16,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => HomeCard(
                          card: cardList[index],
                          canOpenProfile: true,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

import 'package:digital_card_grader/core/features/profile/controllers/collection_card_controller.dart';
import 'package:digital_card_grader/core/features/profile/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';

class CollectionCardScreen extends GetView<CollectionCardController> {
  const CollectionCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card List'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleSpacing: 22,
        leadingWidth: 75,
        actions: [Padding(padding: EdgeInsets.symmetric(horizontal: 35))],
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left_rounded, size: 30),
          onPressed: () => Navigator.maybePop(Get.context!),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Obx(() {
                if(controller.cardList.isEmpty){
                 return Expanded(
                   child: Center(
                      child: Text(
                        "No Cards Available",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                 );
                }
                return Expanded(
                  child: GridView.builder(
                    itemCount: controller.cardList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => CardWidget(
                      cardList: controller.cardList[index],
                      canOpenProfile: true,
                    ),
                  ),
                );
              }),
            ],
          )
        ),
      ),
    );

  }
}

import 'package:digital_card_grader/core/common/common_appbar.dart';
import 'package:digital_card_grader/core/common/common_scaffold.dart';
import 'package:digital_card_grader/core/features/cms/controllers/cms_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class CmsScreens extends GetView<CmsController> {
  const CmsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: commonAppBar(
        centerTitle: true,
        title: controller.type.name,
        style: TextStyle(fontSize: 18),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Html(data: controller.data.value ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}

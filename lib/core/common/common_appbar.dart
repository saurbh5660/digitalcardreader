import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar commonAppBar({
  required String title,
  Widget? child,
  bool isLeading = true,
  Widget? leading,
  bool centerTitle = true,
  TextStyle? style,
  List<Widget>? actions,
}) => AppBar(
  title:
      child ??
      Text(
        title,
        style: style ?? TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
      ),
  centerTitle: centerTitle,
  automaticallyImplyLeading: false,
  titleSpacing: isLeading ? 1 : 22,
  leadingWidth: 75,
  actions: actions,
  leading: isLeading
      ? leading ??
            IconButton(
              icon: const Icon(Icons.arrow_circle_left_rounded, size: 30),
              onPressed: () => Navigator.maybePop(Get.context!),
            )
      : null,
);

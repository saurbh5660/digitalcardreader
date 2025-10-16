import 'package:digital_card_grader/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? body;
  const CommonScaffold({super.key, this.appBar, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.background, AppColors.textGrey],
            stops: [0.65, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: body,
      ),
    );
  }
}

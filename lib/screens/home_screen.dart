import 'package:flutter/material.dart';
import 'package:new_app/utils/app_theme.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class Home extends StatelessWidget {
  static const String routeName = "home";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.background))
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("Islami",style: AppTheme.appBarTextStyle,),
        ),
      ),
    );
  }
}
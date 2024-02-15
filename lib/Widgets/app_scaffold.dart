import 'package:flutter/material.dart';
import 'package:new_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget? bottomNavigation;
  final Widget body;
  const AppScaffold({super.key,
    required this.title,
    required this.body,
     this.bottomNavigation});
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage((provider.isDarkMode()?AppAssets.backgroundDark
              :AppAssets.background),),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          shadowColor: AppColors.transparent,
          centerTitle: true,
          title: Text(title,style: AppTheme.appBarTextStyle,),
        ),
        bottomNavigationBar: bottomNavigation,
        body: body,
      ),
    );
  }
}

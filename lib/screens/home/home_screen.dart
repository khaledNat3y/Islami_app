import 'package:flutter/material.dart';
import 'package:new_app/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:new_app/screens/home/tabs/quran/quran_tab.dart';
import 'package:new_app/screens/home/tabs/radio/radio_tab.dart';
import 'package:new_app/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:new_app/utils/app_theme.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs=[QuranTab(),AhadethTab(),SebhaTab(),RadioTab()];
  int currentTabIndex = 0;
  Widget body = QuranTab();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.background),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: body,
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Islami",style: AppTheme.appBarTextStyle,),
      );

  Widget buildBottomNavigationBar() => Theme(
    data: ThemeData(canvasColor: AppColors.orange,),
    child: BottomNavigationBar(
      // backgroundColor: AppColors.orange,
      // type: BottomNavigationBarType.fixed,
      items: [
        buildBottomNavigationBarItem(AppAssets.icQuran,"Quran"),
        buildBottomNavigationBarItem(AppAssets.icAhadeth,"Ahadeth"),
        buildBottomNavigationBarItem(AppAssets.icSebha,"Sebha"),
        buildBottomNavigationBarItem(AppAssets.icRadio,"Radio"),

      ],
      selectedItemColor: AppColors.lightBlack,
      currentIndex: currentTabIndex,
      onTap: (index){
        currentTabIndex=index;
        body = tabs[index];
        setState(() { });
      },
    ),
  );

  BottomNavigationBarItem buildBottomNavigationBarItem(String imagePath,String label) =>
      BottomNavigationBarItem(icon: ImageIcon(AssetImage(imagePath),size: 32,),label: label);
}
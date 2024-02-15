import 'package:flutter/material.dart';
import 'package:new_app/providers/settings_provider.dart';
import 'package:new_app/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:new_app/screens/home/tabs/quran/quran_tab.dart';
import 'package:new_app/screens/home/tabs/radio/radio_tab.dart';
import 'package:new_app/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:new_app/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs=[const QuranTab(),const AhadethTab(),SebhaTab(),const RadioTab(),const SettingsTab()];
  int currentTabIndex = 0;
  Widget body = const QuranTab();
  @override
  Widget build(BuildContext context) {
    late SettingsProvider provider=Provider.of(context);
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(provider.isDarkMode()?AppAssets.backgroundDark
        :AppAssets.background),fit: BoxFit.fill)
      ),
      child: Scaffold(
        // backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: body,
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        shadowColor: AppColors.transparent,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.islami,
          style: Theme.of(context).appBarTheme.titleTextStyle),
      );

  Widget buildBottomNavigationBar() => Theme(
    data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
    child: BottomNavigationBar(
      // backgroundColor: AppColors.orange,
      // type: BottomNavigationBarType.fixed,
      items: [
        buildBottomNavigationBarItem(AppAssets.icQuran,
            AppLocalizations.of(context)!.quran),
        buildBottomNavigationBarItem(AppAssets.icAhadeth,
            AppLocalizations.of(context)!.ahadeth),
        buildBottomNavigationBarItem(AppAssets.icSebha,
            AppLocalizations.of(context)!.sebha),
        buildBottomNavigationBarItem(AppAssets.icRadio,
            AppLocalizations.of(context)!.radio),
         BottomNavigationBarItem(icon: const Icon(Icons.settings),
             label: AppLocalizations.of(context)!.settings),

      ],
      // selectedItemColor: AppColors.lightBlack,
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
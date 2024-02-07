
import 'package:flutter/material.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:new_app/utils/constants.dart';

import '../../../../utils/app_assets.dart';
class QuranTab extends StatelessWidget {
  const QuranTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.quranTabLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            children: [
              buildScreenContent(),
              Center(child: Container(width: 3,height: double.infinity,color: AppColors.orange,))
            ],
          ),
        ),
      ],
    );
  }
  Column buildScreenContent() {
    return Column(
      children: [
        Container(width: double.infinity,height: 3,color: AppColors.orange,),
         const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("verses:",style: AppTheme.mediumTitleTextStyle,textAlign: TextAlign.center,),
              Text("Sura name:",style: AppTheme.mediumTitleTextStyle,textAlign: TextAlign.center,),
            ],
          ),
        ),
        Container(width: double.infinity,height: 3,color: AppColors.orange,),
        Expanded(child: buildSurasListView()),
      ],
    );
  }

  ListView buildSurasListView() {
    return ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (context, index) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text("${Constants.versesNumber[index]}",
                    textAlign: TextAlign.center,
                    style: AppTheme.regularTitleTextStyle,)),
                  Expanded(child: Text(Constants.suraNames[index],
                    textAlign: TextAlign.center,
                    style: AppTheme.regularTitleTextStyle,)),
                ],
              );
            },
          );
  }
}
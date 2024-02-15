import 'package:flutter/material.dart';
import 'package:new_app/model/screen_details_args.dart';
import 'package:new_app/screens/sura_details/sura_details.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:new_app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              buildScreenContent(context),
              Center(child: Container(width: 3,height: double.infinity,
                color: Theme.of(context).dividerColor,))
            ],
          ),
        ),
      ],
    );
  }
  Column buildScreenContent(BuildContext context) {
    return Column(
      children: [
        Container(width: double.infinity,height: 3,color: Theme.of(context).dividerColor,),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.verses,
                style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              Text(AppLocalizations.of(context)!.sura_name,
                style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            ],
          ),
        ),
        Container(width: double.infinity,height: 3,color: Theme.of(context).dividerColor,),
        Expanded(child: buildSurasListView()),
      ],
    );
  }

  ListView buildSurasListView() {
    return ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  ScreenDetailsArgs args = ScreenDetailsArgs(fileName: "${index + 1}.txt",
                      name: Constants.suraNames[index]);
                  Navigator.pushNamed(context, SuraDetails.routeName,arguments: args);
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: Text("${Constants.versesNumber[index]}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall)),
                    Expanded(child: Text(Constants.suraNames[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall)),
                  ],
                ),
              );
            },
          );
  }
}
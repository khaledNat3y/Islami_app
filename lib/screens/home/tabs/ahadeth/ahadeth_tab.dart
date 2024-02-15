import 'package:flutter/material.dart';
import 'package:new_app/screens/hadeth_details/hadeth_details.dart';
import '../../../../model/screen_details_args.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.ahadethTabLogo))),
        Expanded(
          flex: 7,
          child: buildScreenContent(context),
        ),
      ],
    );
  }
  Column buildScreenContent(BuildContext context) {
    return Column(
      children: [
        Container(width: double.infinity,height: 3,color: Theme.of(context).dividerColor,),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.hadeth_name,
                style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,),
            ],
          ),
        ),
        Container(width: double.infinity,height: 3,color:Theme.of(context).dividerColor,),
        Expanded(child: buildSurasListView()),
      ],
    );
  }

  ListView buildSurasListView() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        ScreenDetailsArgs args = ScreenDetailsArgs(fileName: "h${index+1}.txt",
            name:"الحديث رقم ${index + 1} " );
        return InkWell(
          onTap: (){
            Navigator.pushNamed(context, HadethDetails.routeName, arguments: args);
          },
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Text(args.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,)),
            ],
          ),
        );
      },
    );
  }
}

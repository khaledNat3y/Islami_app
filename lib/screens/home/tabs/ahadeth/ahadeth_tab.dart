import 'package:flutter/material.dart';
import 'package:new_app/screens/hadeth_details/hadeth_details.dart';
import '../../../../model/screen_details_args.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/constants.dart';
import '../../../sura_details/sura_details.dart';
class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex:3,child: Center(child: Image.asset(AppAssets.ahadethTabLogo))),
        Expanded(
          flex: 7,
          child: buildScreenContent(),
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
              Text("Hadeth Name:",style: AppTheme.mediumTitleTextStyle,textAlign: TextAlign.center,),
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
              Expanded(child: Text("الحديث رقم ${index + 1} ",
                textAlign: TextAlign.center,
                style: AppTheme.regularTitleTextStyle,)),
            ],
          ),
        );
      },
    );
  }
}

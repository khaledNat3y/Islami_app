import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/Widgets/app_scaffold.dart';
import 'package:new_app/model/screen_details_args.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';

class HadethDetails extends StatefulWidget {
  static const routeName = "hadeth_details";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String fileContent = "";
  late ScreenDetailsArgs args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if(fileContent.isEmpty) {
      readHadethFile(args.fileName);
    }
    return AppScaffold(title: "Islami",
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.08,
                horizontal: 28),
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              shape: BoxShape.rectangle
            ),
            // alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Text(args.name,style: const TextStyle(fontSize: 25,
                  //     fontWeight: FontWeight.w400,color: AppColors.lightBlack,
                  //     decoration: TextDecoration.underline,
                  //     decorationColor: AppColors.orange,
                  //   decorationThickness: 2,),
                  // ),
                  Text(fileContent,style: AppTheme.regularTitleTextStyle,
                    textDirection: TextDirection.rtl,textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> readHadethFile(String fileName) async {
    Future<String> futureFileContent = rootBundle.loadString("assets/files/ahadeth/$fileName");
    fileContent = await futureFileContent;
    setState(() {});
  }
}

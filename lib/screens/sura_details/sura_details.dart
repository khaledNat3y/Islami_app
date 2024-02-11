import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/Widgets/app_scaffold.dart';
import 'package:new_app/model/screen_details_args.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "sura_details";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    ScreenDetailsArgs args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if(fileContent.isEmpty) {
      readSuraFile(args.fileName);
    }
    return AppScaffold(title: "Islami",
        body:fileContent.isEmpty?Center(child: CircularProgressIndicator(color: AppColors.orange,)) : Center(
          child:Container(
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
                  Text(args.name,style: const TextStyle(fontSize: 25,
                      fontWeight: FontWeight.w400,color: AppColors.lightBlack,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.orange,
                    decorationThickness: 2,),
                  ),
                  Text(fileContent,style: AppTheme.regularTitleTextStyle,
                    textDirection: TextDirection.rtl,textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> readSuraFile(String fileName) async {
    Future<String> futureFileContent = rootBundle.loadString("assets/files/quran/$fileName");
    fileContent = await futureFileContent;
    List<String> fileLines = fileContent.split("\n");
    for(int i = 0; i < fileLines.length; i++) {
      fileLines[i]+= "(${i+1})";
    }
    fileContent =fileLines.join(" ");
    setState(() {});
  }
}

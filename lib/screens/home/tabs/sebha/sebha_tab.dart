import 'package:flutter/material.dart';
import 'package:new_app/providers/settings_provider.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
class SebhaTab extends StatefulWidget {

   SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double turns = 0.0;
  List<String> azkar= ["سُبْحـانَ اللهِ وَبِحَمْـدِهِ", "أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ", "الله اكبر"];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Positioned(
                  left: 170,
                  top: 4,
                    child: Image.asset(provider.isDarkMode()?AppAssets.sebhaHeadDark:AppAssets.sebhaHead)),
                Container(
                    alignment: Alignment.center,
                    child: AnimatedRotation(
                      turns: turns,
                      duration: Duration(seconds: 1),
                      child: Image.asset(provider.isDarkMode()?AppAssets.sebhaBodyDark:AppAssets.sebhaBody)),
                    ),
            
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text("عدد التسبيحات",
                    style: Theme.of(context).textTheme.bodySmall),
                ),
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape:ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        backgroundColor: (provider.isDarkMode()?AppColors.primiaryDark : AppColors.orange),
                        padding: EdgeInsets.all(25),
                      ),
                  
                      onPressed: (){
                        counter++;
                        if(counter % 33 == 0) {
                          azkar[index++];
                          if(index > azkar.length-1) {
                            index = 0;
                          }
                        }
                        turns += 1/33;
                        setState(() {});
                      },
                      child: Text("$counter",style: Theme.of(context).textTheme.bodySmall,)),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    shape: BoxShape.rectangle,
                    color: (provider.isDarkMode()?AppColors.accentDark : AppColors.orange),
                  ),
                  child: Text(azkar[index],style: TextStyle(color:  (provider.isDarkMode()?AppColors.lightBlack : AppColors.white),
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}







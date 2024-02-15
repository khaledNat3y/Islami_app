import 'package:flutter/material.dart';
import 'package:new_app/providers/settings_provider.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Container(height: 50,),
        Text("إذاعة القرآن الكريم",style: Theme.of(context).textTheme.bodySmall),
        Container(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,size: 42,
              color: (provider.isDarkMode()?AppColors.accentDark : AppColors.orange),)),
            IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_sharp,size: 52,color:
            (provider.isDarkMode()?AppColors.accentDark : AppColors.orange),)),
            IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,size: 42,color:
            (provider.isDarkMode()?AppColors.accentDark : AppColors.orange),)),

          ],
        ),
      ],
    );
  }
}
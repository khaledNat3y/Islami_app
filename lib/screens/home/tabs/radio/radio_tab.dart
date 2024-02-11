import 'package:flutter/material.dart';
import 'package:new_app/utils/app_colors.dart';
import 'package:new_app/utils/app_theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Container(height: 50,),
        Text("إذاعة القرآن الكريم",style: AppTheme.mediumTitleTextStyle,),
        Container(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,size: 42,color: AppColors.orange,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_sharp,size: 52,color: AppColors.orange,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,size: 42,color: AppColors.orange,)),

          ],
        ),
      ],
    );
  }
}
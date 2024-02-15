import 'package:flutter/material.dart';
import 'package:new_app/providers/settings_provider.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_colors.dart';

class SettingsTab extends StatefulWidget {

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  static const String arabicValue = "ar";
  static const String englishValue = "en";
  String selectedLocale = englishValue;
  bool darkModeSwitch = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
            child: Text(AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.bodySmall,)),
        const SizedBox(height: 30,),
        // buildSettingsRow(AppLocalizations.of(context)!.arabic, arSwitch, (newValue){
        //   arSwitch = newValue;
        //   if(arSwitch) {
        //     provider.setCurrentLocale("ar");
        //   }else {
        //     provider.setCurrentLocale("en");
        //   }
        // }),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(5),
          child: DropdownButton(
            value: selectedLocale,
            dropdownColor: provider.isDarkMode()?AppColors.lightBlack:AppColors.white,
            items:  [
              DropdownMenuItem(
                value: arabicValue,
                  child: Text("العربية",style: Theme.of(context).textTheme.bodyMedium,),
                onTap: () {
                  if(provider.isDarkMode()) {
                    Theme.of(context).textTheme.bodyMedium;
                  }
                },
              ),
              DropdownMenuItem(
                value: englishValue,
                child: Text("English",style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
            isExpanded: true,
            onChanged: (String? newValue){
              if(newValue == null) return;
              selectedLocale = newValue;
              provider.setCurrentLocale(selectedLocale);
            },
          ),
        ),
        const SizedBox(height: 30,),
        buildSettingsRow(
            AppLocalizations.of(context)!.dark_mode, darkModeSwitch, (newValue){
          darkModeSwitch = newValue;
          if(darkModeSwitch) {
            provider.setCurrentThemeMode(ThemeMode.dark);
          }else {
            provider.setCurrentThemeMode(ThemeMode.light);
          }
          setState(() {});
        }),
      ],
    );
  }

  Widget buildSettingsRow(String title, bool switchValue,Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          const SizedBox(width: 7,),
          Text(title,style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          Switch(value: switchValue, onChanged: onChanged,
            activeColor: AppColors.orange,)
        ],
      ),
    );
  }
}

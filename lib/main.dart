import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_app/providers/settings_provider.dart';
import 'package:new_app/screens/hadeth_details/hadeth_details.dart';
import 'package:new_app/screens/home/home_screen.dart';
import 'package:new_app/screens/splash/splash_screen.dart';
import 'package:new_app/screens/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_app/utils/app_theme.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (_)=>SettingsProvider(),
      child: MyApp()
  ));
  ///Made with ♥ by Khaled Nat3y.
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const[
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(provider.currentLocale),
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        Home.routeName:(_)=>Home(),
        Splash.routeName:(_)=>Splash(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        HadethDetails.routeName:(_)=>HadethDetails(),
      },
      initialRoute: Home.routeName,
    );
  }
}


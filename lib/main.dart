import 'package:flutter/material.dart';
import '../../../../core/provider/Settings_Provider/Settings_Provider.dart';
import 'package:provider/provider.dart';
import 'core/resources/application_theme_manager.dart';
import 'feature/Hadeeth/presentation/Hadith_details_View.dart';
import 'feature/Lay_Out/Lay_Out_View.dart';
import 'feature/Quran/presentaion/pages/Quran_details_view.dart';
import 'feature/splash/presentation/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(context) => Settings_Provider() ,
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)  {
    var provider = Provider.of<Settings_Provider>(context);
    return  MaterialApp(
      darkTheme: ApplicationThemeManager.darkThemeData,
      themeMode:provider.currentThemeMode,
      locale: Locale(provider. currentLanguage),
      theme: ApplicationThemeManager.lightThemeData,
      title: 'Islami App',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales:AppLocalizations.supportedLocales ,
      debugShowCheckedModeBanner: false ,
      initialRoute: "/",
        routes: {
          Splash_View.routeName: (context) => const Splash_View(),
          Lay_Out_View.routeName: (context) => const Lay_Out_View(),
          Quran_Details_View.routeName: (context) => const Quran_Details_View(),
          HadithDetailsView.routeName: (context) => const HadithDetailsView(),
        }
    );
  }
}



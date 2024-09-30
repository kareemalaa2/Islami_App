import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import '../../../../core/provider/Settings_Provider/Settings_Provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/resources/colors_palette.dart';

const List<String> lang_List = ['English', "عربي"];
const List<String> theme_List = ['Dark', "Light"];

class Settings_View extends StatefulWidget {
  const Settings_View({super.key});

  @override
  State<Settings_View> createState() => _Settings_ViewState();
}

class _Settings_ViewState extends State<Settings_View> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<Settings_Provider>(context);
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang.languages,
            style: theme.textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdown<String>(
            items: lang_List,
            initialItem:
                provider.currentLanguage == 'en' ? lang_List[0] : lang_List[1],
            onChanged: (value) {
              if (value == 'English') {
                provider.changeLanguage('en');
              } else if (value == 'عربي') {
                provider.changeLanguage('ar');
              }
              log('changing value to: $value');
            },
            decoration:  CustomDropdownDecoration(
              closedSuffixIcon: Icon(Icons.arrow_downward , color: provider.isDark()?ColorsPalette.darkPrimary: Colors.black  ,),
              expandedSuffixIcon:  Icon(Icons.arrow_upward , color: provider.isDark()?ColorsPalette.darkPrimary: Colors.black  ,),
              closedFillColor: provider.isDark()?ColorsPalette.darkPrimaryButton: Colors.white ,
              expandedFillColor:  provider.isDark()?ColorsPalette.darkPrimaryButton: Colors.white ,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            lang.theme,
            style: theme.textTheme.displayLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdown<String>(
            items: theme_List,
            initialItem: provider.currentThemeMode ==ThemeMode.dark  ? theme_List[0] : theme_List[1],
            onChanged: (value) {
              if (value == 'Dark') {
              provider.changeThemeMode(ThemeMode.dark);
            } else if (value == 'Light') {
                provider.changeThemeMode(ThemeMode.light);
            }
              log('changing value to: $value');
            },
            decoration:  CustomDropdownDecoration( 
              closedSuffixIcon: Icon(Icons.arrow_downward , color: provider.isDark()?ColorsPalette.darkPrimary: Colors.black  ,),
              expandedSuffixIcon:  Icon(Icons.arrow_upward , color: provider.isDark()?ColorsPalette.darkPrimary: Colors.black  ,),
              closedFillColor: provider.isDark()?ColorsPalette.darkPrimaryButton: Colors.white ,
              expandedFillColor:  provider.isDark()?ColorsPalette.darkPrimaryButton: Colors.white ,
            ),
          )
        ],
      ),
    );
  }
}

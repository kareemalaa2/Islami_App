import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/Settings_Provider/Settings_Provider.dart';
import '../../../core/resources/colors_palette.dart';
import 'Hadeeth_View.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithDetailsView extends StatelessWidget {
  static const String routeName = 'HadithDetailsView';

  const HadithDetailsView({super.key});

  @override
  Widget build(BuildContext context) { 
    var data = ModalRoute.of(context)?.settings.arguments as HadithData ;
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    var provider = Provider.of<Settings_Provider>(context);

    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(provider.getHomeBackGround()) , fit: BoxFit.cover,),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Center(
            child: Text(
            lang.islami,
              style: theme.textTheme.displayLarge
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(
              top: 10, left: 30, right: 30, bottom: 80),
          padding: const EdgeInsets.only(
              top: 20, left: 30, right: 30, bottom: 20),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? ColorsPalette.darkBackGroundColorForQuran.withOpacity(0.80)
                : ColorsPalette.unSelectedItemBottom,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                data.title,
                style:theme.textTheme.bodyMedium?.copyWith(
                  color : provider.isDark()
                      ? theme.primaryColorDark
                      : ColorsPalette.black ,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Center(
                    child: Text(data.body,
                      style:theme.textTheme.bodyMedium?.copyWith(
                      color : provider.isDark()
                          ? theme.primaryColorDark
                          : ColorsPalette.black ,
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
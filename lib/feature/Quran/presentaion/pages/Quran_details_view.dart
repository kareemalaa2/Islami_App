import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../core/provider/Settings_Provider/Settings_Provider.dart';
import '../../../../core/resources/colors_palette.dart';
import 'Quran_View.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Quran_Details_View extends StatefulWidget {
  static const String routeName = 'quranDetails';
  const Quran_Details_View({super.key});

  @override
  State<Quran_Details_View> createState() => _Quran_Details_ViewState();
}

class _Quran_Details_ViewState extends State<Quran_Details_View> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Settings_Provider>(context);
    var data = ModalRoute.of(context)?.settings.arguments as SuraData;
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;

    if (Content.isEmpty) loadData(data.suraNumber);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              provider.getHomeBackGround(),
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(lang.islami, style: theme.textTheme.displayLarge),
          ),
        ),
        body: Container(
          margin:
              const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 80),
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
          decoration: BoxDecoration(
            color: provider.isDark()
                ? ColorsPalette.darkBackGroundColorForQuran.withOpacity(0.80)
                : ColorsPalette.unSelectedItemBottom,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                'سورة ${data.suraName}',
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
                    child: Text(
                      '{${index + 1}} ${versesList[index]}',
                      style:theme.textTheme.bodyMedium?.copyWith(
                        color : provider.isDark()
                            ? theme.primaryColorDark
                            : ColorsPalette.black ,
                      ),
                    ),
                  ),
                  itemCount: versesList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String Content = '';
  List<String> versesList = [];

  Future<void> loadData(String suraNumber) async {
    Content = await rootBundle.loadString('assets/Files/$suraNumber.txt');
    versesList = Content.split('\n');
    setState(() {});
    print(Content);
  }
}

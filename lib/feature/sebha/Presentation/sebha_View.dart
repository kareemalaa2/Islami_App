import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/provider/Settings_Provider/Settings_Provider.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/colors_palette.dart';

class Sebha_View extends StatefulWidget {
  @override
  _TasbeehViewState createState() => _TasbeehViewState();
}
class _TasbeehViewState extends State<Sebha_View> {
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
  ];

  double rotate = 0;
  int counter = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var provider = Provider.of<Settings_Provider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    onClick();
                  },
                  child: Transform.rotate(
                    angle: rotate,
                    child: Image.asset(provider.getSebhaBackGround()),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
              lang.numberOfPraises,
            style:theme.textTheme.bodyMedium?.copyWith(
              color : provider.isDark()
                  ? Colors.white
                  : ColorsPalette.black ,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: 70.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: provider.isDark()?Colors.blue[600]?.withOpacity(0.6)
              : ColorsPalette.primary.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text(
              '$counter',
              style:theme.textTheme.bodyMedium?.copyWith(
                color : provider.isDark()
                    ? Colors.white
                    : ColorsPalette.black ,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          GestureDetector(
            onTap: () {
              onClick();
            },
            child: Container(
              alignment: Alignment.center,
              width: 140.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: provider.isDark()?ColorsPalette.darkPrimary
                    : ColorsPalette.primary,
                     borderRadius: BorderRadius.circular(25.0),
              ),
              child: Text(
                azkar[currentIndex],
                textAlign: TextAlign.center,
                style: provider.isDark() ? theme.textTheme.bodyMedium?.copyWith(color: Colors.black)
                : theme.textTheme.bodyMedium?.copyWith(color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    setState(() {
      counter++;
      rotate--;
      if (counter == 34) {
        currentIndex++;
        counter = 0;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }
}

import 'package:flutter/material.dart';
import '../../data/Sura_Names.dart';
import '../../widget/Sura_title_Widget.dart';
import 'Quran_details_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var theme = Theme.of(context);
    return Scaffold(
        body: Column(
          children: [
            Image.asset(
              'assets/images/quran_header_icn.png',
              scale: 3,
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    lang.numberOfTheSura,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 35,
                  child: VerticalDivider(
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    lang.suraName,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: suraNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Quran_Details_View.routeName,
                          arguments: SuraData(
                            suraName: suraNames[index],  // Pass the correct sura name
                            suraNumber: (index + 1).toString(),  // Pass the correct sura number
                          ),
                        );
                      },
                      child: SuraTitleWidget(
                        suraData: SuraData(
                            suraName: suraNames[index],
                            suraNumber: (index + 1).toString()),
                      ),
                    );
                  }),
            )
          ],
        ),
    );
  }
}
class SuraData {
  final String suraName;
  final String suraNumber;

  SuraData({required this.suraName, required this.suraNumber});
}

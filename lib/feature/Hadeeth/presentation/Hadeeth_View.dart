import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/resources/colors_palette.dart';
import 'Hadith_details_View.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Hadeeth_View extends StatefulWidget {
  const Hadeeth_View({super.key});

  @override
  State<Hadeeth_View> createState() => _Hadeeth_ViewState();
}

class _Hadeeth_ViewState extends State<Hadeeth_View> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    if (dataList.isEmpty) loadHadithData();

    return Column(
      children: [
        Image.asset('assets/images/hadith_header.png'),
        const Divider(),
        Text(
          lang.hadeeth,
          style: theme.textTheme.bodyLarge,
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HadithDetailsView.routeName,
                      arguments: dataList[index],
                    );
                  },
                  child: Text(
                    dataList[index].title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  List<HadithData> dataList = [];
  Future<void> loadHadithData() async {
    String Content = await rootBundle.loadString('assets/Files/ahadeth.txt');
    List<String> allHadithData = Content.split('#');
    for (int i = 0; i < allHadithData.length; i++) {
      String singleHadith = allHadithData[i].trim();

      int titleLength = singleHadith.indexOf('\n');

      String title = singleHadith.substring(0, titleLength);
      String body = singleHadith.substring(titleLength + 1);

      HadithData hadithData = HadithData(title: title, body: body);
      dataList.add(hadithData);

      setState(() {});
    }
  }
}

class HadithData {
  final String title;
  final String body;

  HadithData({required this.title, required this.body});
}

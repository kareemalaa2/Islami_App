import 'package:flutter/material.dart';
import 'package:islamiapp/feature/Hadeeth/presentation/Hadeeth_View.dart';
import 'package:islamiapp/feature/Quran/presentaion/pages/Quran_View.dart';
import 'package:islamiapp/feature/Radio/presentation/Radio_View.dart';
import 'package:islamiapp/feature/sebha/Presentation/sebha_View.dart';
import 'package:islamiapp/feature/settings/presentation/settings_View.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/Settings_Provider/Settings_Provider.dart';


class Lay_Out_View extends StatefulWidget {
  static const String routeName = "LayOut";

  const Lay_Out_View({super.key});

  @override
  State<Lay_Out_View> createState() => _Lay_Out_ViewState();
}

class _Lay_Out_ViewState extends State<Lay_Out_View> {
  int selectedIndex = 0 ;
  List<Widget> screensList = [
    QuranView() ,
    const Hadeeth_View(),
     Sebha_View () ,
    const Radio_View(),
    const Settings_View()
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Settings_Provider>(context);
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(image: AssetImage(provider.getHomeBackGround()) , fit: BoxFit.cover,),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Center(child: Text(lang.islami)),
        ),
        body: screensList[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value ;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items:  [
            BottomNavigationBarItem(icon: const ImageIcon(AssetImage('assets/icons/quran.png')), label: lang.quran),
            BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/icons/hadeeth.png")), label: lang.hadeeth ),
            BottomNavigationBarItem(icon: const ImageIcon(AssetImage('assets/icons/sebha.png')), label: lang.tasbeeh),
            BottomNavigationBarItem(icon: const ImageIcon(AssetImage('assets/icons/radio.png')), label: lang.radio),
            BottomNavigationBarItem(icon: (const Icon(Icons.settings)), label: lang.setting),
          ],
        ),

      ),
    );
  }
}

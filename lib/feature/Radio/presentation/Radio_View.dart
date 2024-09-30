import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/provider/Settings_Provider/Settings_Provider.dart';
import '../../../core/provider/Radio_Provider/Radio_provider.dart';
import '../../../core/resources/colors_palette.dart';

class Radio_View extends StatefulWidget {
  const Radio_View({super.key});

  @override
  State<Radio_View> createState() => _Radio_ViewState();
}

class _Radio_ViewState extends State<Radio_View> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    var provider = Provider.of<Settings_Provider>(context, listen: true);
    var theme = Theme.of(context);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => RadioProvider()..getRadios(),
        builder: (newContext, child) {
          var provider2 = Provider.of<RadioProvider>(newContext);
          if (provider2.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if(provider2.isError){
            return const Center(child: Text('Error'),);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -100),
                child: Center(
                  child: Image.asset('assets/images/radio_image.png'),
                ),
              ),
              Text(
                provider2.curRadio.name,
                style: theme.textTheme.displayLarge,
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // Centers children horizontally
                children: [
                  IconButton(
                    onPressed: () {
                      provider2.previous();
                    },
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: provider.isDark()
                          ? ColorsPalette.darkPrimary
                          : ColorsPalette.primary,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider2.play();
                    },
                    icon: Icon(
                      provider2.isPlaying?
                      Icons.pause
                      :Icons.play_arrow,
                          color: provider.isDark()
                          ? ColorsPalette.darkPrimary
                          : ColorsPalette.primary,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider2.next();
                    },
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: provider.isDark()
                          ? ColorsPalette.darkPrimary
                          : ColorsPalette.primary,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
  void dispose(){
    super.dispose();
  }
}

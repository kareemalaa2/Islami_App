import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentaion/pages/Quran_View.dart';

class SuraTitleWidget extends StatelessWidget {
  const SuraTitleWidget({
    super.key,
    required this.suraData,
  });

  final SuraData suraData;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            suraData.suraNumber,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            thickness: 2,
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            suraData.suraName,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

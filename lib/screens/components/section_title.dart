import 'package:carousel/screens/components/circle_btn.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/material.dart';

Padding sectionTitle({
  required BuildContext context,
  required String icon,
  required double fontSize,
  required String title,
  required String subtitle,
}) {
  return Padding(
    padding: AppSizing.kMainPadding(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        richTitle(title, context, fontSize, subtitle),
        CircleButton(icon: icon),
      ],
    ),
  );
}

RichText richTitle(
    String title, BuildContext context, double fontSize, String subtitle) {
  return RichText(
    text: TextSpan(
      text: title,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Theme.of(context).highlightColor,
            fontSize: fontSize,
          ),
      children: <TextSpan>[
        TextSpan(
          text: ' $subtitle',
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      ],
    ),
  );
}

Padding appTitle(
    {required BuildContext context,
    required String icon1,
    required String icon2,
    required double fontSize,
    required String title,
    required String subtitle,
    double? raduis}) {
  return Padding(
    padding: AppSizing.kMainPadding(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Theme.of(context).highlightColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w800),
            children: <TextSpan>[
              TextSpan(
                text: ' $subtitle',
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: fontSize * 0.8,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        Row(
          children: [
            CircleButton(
              icon: icon1,
              radius: raduis,
            ),
            const SizedBox(width: 10),
            CircleButton(
              icon: icon2,
              radius: raduis,
            ),
          ],
        ),
      ],
    ),
  );
}

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
        RichText(
          text: TextSpan(
            text: title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).highlightColor,
                  fontSize: fontSize,
                ),
            children: <TextSpan>[
              TextSpan(
                text: '\n$subtitle',
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
        CircleButton(icon: icon),
      ],
    ),
  );
}

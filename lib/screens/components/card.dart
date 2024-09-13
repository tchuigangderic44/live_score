import 'package:carousel/screens/card_details.dart';
import 'package:carousel/screens/components/match.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/material.dart';

import '../../models/play_off.dart';

class MatchCard extends StatelessWidget {
  final int index;
  final int activeIndex;
  final PlayOff playOff;
  const MatchCard({
    required this.index,
    required this.activeIndex,
    required this.playOff,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double factor = 0.03;
    double maxHeight = activeIndex == index
        ? AppSizing.height(context) * 0.5
        : AppSizing.height(context) * 0.2;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CardDetails(
                index: index,
                playOff: playOff,
              ),
            ));
      },
      child: Hero(
        tag: 'hero_$index',
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!,
          child: AnimatedContainer(
            clipBehavior: Clip.none,
            duration: const Duration(milliseconds: 300),
            constraints: BoxConstraints(maxHeight: maxHeight),
            height: maxHeight,
            margin: EdgeInsets.only(right: AppSizing.width(context) * factor),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF263238),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SingleChildScrollView(
                child: Center(
                    child: PlayOffWidget(
              playOff: playOff,
            ))),
          ),
        ),
      ),
    );
  }
}

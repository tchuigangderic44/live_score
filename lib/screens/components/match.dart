import 'package:carousel/utils/sizing.dart';
import 'package:flutter/material.dart';

import '../../models/play_off.dart';

class PlayOffWidget extends StatelessWidget {
  final PlayOff playOff;
  final bool showPlace;
  const PlayOffWidget({
    required this.playOff,
    this.showPlace = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text:
                '${playOff.championshipType} . ${playOff.competitionLevel} . Group ${playOff.group}',
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '\n Day ${playOff.matchDay}',
                style: TextStyle(color: Theme.of(context).highlightColor),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  playOff.homeFlag,
                  width: 50,
                  height: 50,
                ),
                Text(
                  playOff.homeTeam,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(
              '${playOff.homeScore} : ${playOff.awayScore}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Column(
              children: [
                Image.asset(
                  playOff.awayFlag,
                  width: 50,
                  height: 50,
                ),
                Text(
                  playOff.awayTeam,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          width: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.greenAccent,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Text(
                      '88',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Positioned(
                      top: -3,
                      right: -3,
                      child: Text(
                        "'",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/ball.png',
              width: 20,
              height: 20,
              color: Theme.of(context).highlightColor,
            )),
        SizedBox(
          width: AppSizing.width(context) * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  playOff.homeScorer.length,
                  (index) => Text(
                    playOff.homeScorer[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  playOff.awayScorer.length,
                  (index) => Text(
                    playOff.awayScorer[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

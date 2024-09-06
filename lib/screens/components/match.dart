import 'package:carousel/models/playoff.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Text(
          playOff.title,
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
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
                  playOff.time1Flag,
                  width: 50,
                  height: 50,
                ),
                Text(
                  playOff.time1Name,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(
              playOff.status != 'finished' ? 'Versus' : '0 : 0',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
            Column(
              children: [
                Image.asset(
                  playOff.time2Flag,
                  width: 50,
                  height: 50,
                ),
                Text(
                  playOff.time2Name,
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
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Text(
            playOff.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (showPlace)
          RichText(
            text: TextSpan(
              text: 'Lieu : ',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.greenAccent,
                    fontSize: 14,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: playOff.place,
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ],
            ),
          ),
        const SizedBox(height: 10),
        
        Container(
          width: AppSizing.width(context) * 0.4,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Theme.of(context).highlightColor,
              ),
              color: Colors.transparent),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.ticket_fill,
                size: 24,
                color: Theme.of(context).primaryColorLight,
              ),
              const SizedBox(width: 10),
              Text(
                'buy tickets',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

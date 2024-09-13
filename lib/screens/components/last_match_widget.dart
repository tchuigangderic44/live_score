import 'package:carousel/models/play_off.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayOffCard extends StatefulWidget {
  final PlayOff playOff;
  const PlayOffCard({super.key, required this.playOff});

  @override
  State<PlayOffCard> createState() => _PlayOffCardState();
}

class _PlayOffCardState extends State<PlayOffCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          width: AppSizing.width(context),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              border: Border.all(color: Colors.white.withOpacity(0.7)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.playOff.championshipType} . ${widget.playOff.competitionLevel} . Group ${widget.playOff.group}\nDay ${widget.playOff.matchDay}',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: AppSizing.width(context) / 1.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              widget.playOff.homeFlag,
                              scale: 5,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.playOff.homeTeam,
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.playOff.homeScore,
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/triangle.png',
                              scale: 9,
                              color: widget.playOff.homeScore == ''
                              ? Colors.transparent
                              : int.parse(widget.playOff.homeScore) >
                                      int.parse(widget.playOff.awayScore)
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                            const SizedBox(width: 2),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Image.asset(
                              widget.playOff.awayFlag,
                              scale: 5,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.playOff.awayTeam,
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.playOff.awayScore,
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Image.asset(
                              'assets/icons/triangle.png',
                              scale: 9,
                              color: widget.playOff.homeScore == ''
                              ? Colors.transparent
                               : int.parse(widget.playOff.homeScore) <
                                      int.parse(widget.playOff.awayScore)
                                  ? Colors.black
                                  : Colors.transparent,
                            ),
                            const SizedBox(width: 2),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 1,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  const Spacer(),
                  SizedBox(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.playOff.status.name,
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.playOff.matchDate,
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          widget.playOff.status.isCompleted
                              ? Container(
                                  width: 100,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              widget.playOff.winnerImg),
                                          fit: BoxFit.cover)),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: 60,
                                          height: 20,
                                          color: Colors.black,
                                          child: const Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              Text(
                                                '5:00',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  width: AppSizing.width(context) * 0.3,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Theme.of(context).highlightColor,
                                      ),
                                      color: Colors.transparent),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.ticket,
                                        size: 20,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'buy tickets',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

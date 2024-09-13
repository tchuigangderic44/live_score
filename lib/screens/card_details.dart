import 'package:carousel/models/stats.dart';
import 'package:carousel/screens/components/circle_btn.dart';
import 'package:carousel/screens/components/match.dart';
import 'package:carousel/screens/components/search_bar.dart';
import 'package:carousel/utils/app_color.dart';
import 'package:carousel/utils/app_icons.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/material.dart';

import '../models/play_off.dart';

class CardDetails extends StatefulWidget {
  final int index;
  final PlayOff playOff;
  const CardDetails({required this.index, required this.playOff, super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  ScrollController scrollController = ScrollController();
  PageController? pageController;
  int activeIndex = 0;
  bool topScore = false;

  final duration = const Duration(milliseconds: 1000);
  final curve = Curves.bounceInOut;

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    pageController =
        PageController(initialPage: selectedIndex, viewportFraction: 1);
    super.initState();
  }

  void _scrollListener() {
    if (scrollController.position.pixels > AppSizing.height(context) / 2.8 &&
        !topScore) {
      setState(() {
        topScore = true;
      });
    } else if (scrollController.position.pixels <=
            AppSizing.height(context) / 2.8 &&
        topScore) {
      setState(() {
        topScore = false;
      });
    }
  }

  @override
  void dispose() {
    pageController?.dispose();
    scrollController.dispose();
    super.dispose();
  }

  final List<String> titlesList = ['Composition', 'Stats', 'Rankings'];
  int selectedIndex = 0;

  void changeActiveIndex(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  List<Stats> stats = const [
    Stats(homeStat: '17', awayStat: '9', title: 'Shots'),
    Stats(homeStat: '5', awayStat: '2', title: 'Shots on target'),
    Stats(homeStat: '63%', awayStat: '37%', title: 'Possession'),
    Stats(homeStat: '473', awayStat: '230', title: 'Passes'),
    Stats(homeStat: '86%', awayStat: '72%', title: 'Passing accuracy'),
    Stats(homeStat: '12', awayStat: '10', title: 'Fouls'),
    Stats(homeStat: '0', awayStat: '2', title: 'Yellow cards'),
    Stats(homeStat: '0', awayStat: '0', title: 'Red cards'),
    Stats(homeStat: '1', awayStat: '5', title: 'Offside'),
    Stats(homeStat: '4', awayStat: '3', title: 'Corner'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'hero_${widget.index}',
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyMedium!,
                      child: Container(
                        height: AppSizing.height(context) / 2.1,
                        width: AppSizing.width(context),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xFF263238),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleButton(
                                    icon: AppIcons.back,
                                    color: AppColors.bgBlack,
                                    onTap: () {
                                      Navigator.pop(context);
                                      // setState(() {
                                      //   hasPushed = true;
                                      // });
                                    },
                                  ),
                                  CircleButton(
                                    icon: AppIcons.pin,
                                    color: AppColors.bgBlack,
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              PlayOffWidget(
                                playOff: widget.playOff,
                                showPlace: true,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomTabBar(
                        changeIndex: changeActiveIndex,
                        titlesList: titlesList,
                        selectedIndex: selectedIndex),
                  ),
                  playOffAnalyticsView(context, selectedIndex)
                ],
              ),
            ),
            AnimatedPositioned(
              duration: duration,
              top: topScore ? 0 : -200,
              left: 0,
              right: 0,
              child: Container(
                padding: AppSizing.kMainPadding(context),
                width: AppSizing.width(context),
                height: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFF263238),
                  border: Border(
                    bottom: BorderSide(width: 2, color: Colors.white),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.playOff.homeFlag,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.playOff.homeTeam,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Spacer(),
                    Text(
                      '${widget.playOff.homeScore} : ${widget.playOff.awayScore}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 10),
                    Text(
                      widget.playOff.awayTeam,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      widget.playOff.awayFlag,
                      width: 25,
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget playOffAnalyticsView(BuildContext context, int currentIndex) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: AppSizing.width(context),
              height: 50,
              color: Colors.green,
              child: Container(
                padding: AppSizing.kMainPadding(context),
                width: AppSizing.width(context),
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.playOff.homeFlag,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.playOff.homeTeam,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '4-1-4-1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                child: Image.asset(
              'assets/images/stadium.png',
              fit: BoxFit.cover,
            )),
            Container(
              width: AppSizing.width(context),
              height: 50,
              color: Colors.green,
              child: Container(
                padding: AppSizing.kMainPadding(context),
                width: AppSizing.width(context),
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.playOff.awayFlag,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.playOff.awayTeam,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '4-2-3-1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: AppSizing.width(context),
              height: 50,
              color: Colors.green,
              child: Container(
                padding: AppSizing.kMainPadding(context),
                width: AppSizing.width(context),
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppIcons.fstadium,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.playOff.stadium,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          color: Colors.transparent,
          width: AppSizing.width(context),
          padding: AppSizing.kMainPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.playOff.homeFlag,
                    width: 25,
                    height: 25,
                  ),
                  const Spacer(),
                  Image.asset(
                    widget.playOff.awayFlag,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    stats.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                stats[index].homeStat,
                                style: const TextStyle(
                                  color: AppColors.bgWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                stats[index].title,
                                style: const TextStyle(
                                  color: AppColors.bgWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                stats[index].awayStat,
                                style: const TextStyle(
                                  color: AppColors.bgWhite,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}

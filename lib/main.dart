import 'package:carousel/models/play_off.dart';
import 'package:carousel/screens/components/card.dart';
import 'package:carousel/screens/components/last_match_widget.dart';
import 'package:carousel/screens/components/search_bar.dart';
import 'package:carousel/screens/components/section_title.dart';
import 'package:carousel/utils/app_icons.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF37474F)),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF37474F),
          primaryColorDark: Colors.black),
      home: const FlutterAnimations(),
    );
  }
}

class FlutterAnimations extends StatefulWidget {
  const FlutterAnimations({super.key});

  @override
  State<FlutterAnimations> createState() => _FlutterAnimationsState();
}

class _FlutterAnimationsState extends State<FlutterAnimations> {
  final duration = const Duration(milliseconds: 3000);
  final curve = Curves.elasticOut;

  PageController? pageController;

  bool hasZoomed = false;

  int activeIndex = 0;

  int selectedIndex = 0;

  void changeActiveIndex(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    super.initState();
  }

  List<String> scheduleItem = ['Finish', 'Pending', 'Postpone'];

  List<PlayOff> liveScores = [
    PlayOff(
        homeTeam: 'Cameroon',
        awayTeam: 'Zimbabwe',
        homeScore: '2',
        awayScore: '0',
        homeFlag: 'assets/images/cameroun.png',
        awayFlag: 'assets/images/zimbabwe.png',
        matchDate: '08/07/24',
        matchTime: '17:00',
        championshipType: 'CAN play-off',
        status: PlayOffStatus.completed,
        group: 'J',
        matchDay: '1 of 6',
        competitionLevel: 'Group phase',
        stadium: 'Omnisport Roumde Adja Stadium',
        winnerImg: 'assets/images/images.jpg',
        homeScorer: [
          "C. Baleba 15'",
          "V. Aboubakar 63'",
        ],
        awayScorer: [
          ''
        ]),
    PlayOff(
        homeTeam: 'Kenya',
        awayTeam: 'Namibie',
        homeScore: '0',
        awayScore: '0',
        homeFlag: 'assets/images/kenya.png',
        awayFlag: 'assets/images/namibie.png',
        matchDate: '08/07/24',
        matchTime: '17:00',
        championshipType: 'CAN play-off',
        status: PlayOffStatus.completed,
        group: 'J',
        matchDay: '1 of 6',
        competitionLevel: 'Group phase',
        stadium: 'Omnisport Roumde Adja Stadium',
        winnerImg: 'assets/images/images.jpg',
        homeScorer: [],
        awayScorer: []),
  ];

  List<PlayOff> playSchedules = [
    PlayOff(
        homeTeam: 'Cameroon',
        awayTeam: 'Zimbabwe',
        homeScore: '2',
        awayScore: '0',
        homeFlag: 'assets/images/cameroun.png',
        awayFlag: 'assets/images/zimbabwe.png',
        matchDate: '08/07/24',
        matchTime: '17:00',
        championshipType: 'CAN play-off',
        status: PlayOffStatus.completed,
        group: 'J',
        matchDay: '1 of 6',
        competitionLevel: 'Group phase',
        stadium: 'Omnisport Roumde Adja Stadium',
        winnerImg: 'assets/images/images.jpg',
        homeScorer: [
          "C. Baleba 15'",
          "V. Aboubakar 63'",
        ],
        awayScorer: [
          ''
        ]),
    PlayOff(
        homeTeam: 'Kenya',
        awayTeam: 'Namibie',
        homeScore: '0',
        awayScore: '0',
        homeFlag: 'assets/images/kenya.png',
        awayFlag: 'assets/images/namibie.png',
        matchDate: '08/07/24',
        matchTime: '17:00',
        championshipType: 'CAN play-off',
        status: PlayOffStatus.completed,
        group: 'J',
        matchDay: '1 of 6',
        competitionLevel: 'Group phase',
        stadium: 'Omnisport Roumde Adja Stadium',
        winnerImg: 'assets/images/images.jpg',
        homeScorer: [],
        awayScorer: []),
    PlayOff(
        homeTeam: 'Kenya',
        awayTeam: 'Cameroon',
        homeScore: '',
        awayScore: '',
        homeFlag: 'assets/images/kenya.png',
        awayFlag: 'assets/images/cameroun.png',
        matchDate: '08/11/24',
        matchTime: '17:00',
        championshipType: 'CAN play-off',
        status: PlayOffStatus.pending,
        group: 'J',
        matchDay: '1 of 6',
        competitionLevel: 'Group phase',
        stadium: 'Omnisport Roumde Adja Stadium',
        winnerImg: 'assets/images/images.jpg',
        homeScorer: [],
        awayScorer: []),
  ];

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appTitle(
                context: context,
                icon1: AppIcons.search,
                icon2: AppIcons.notification,
                fontSize: 25,
                title: "Fecafoot",
                subtitle: "Live",
                raduis: 20),
            const SizedBox(height: 20),
            Container(
              clipBehavior: Clip.none,
              key: ValueKey(hasZoomed),
              height: AppSizing.height(context) * 0.38,
              child: Center(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: liveScores.length,
                  onPageChanged: (page) {
                    setState(() {
                      activeIndex = page;
                    });
                  },
                  itemBuilder: (c, i) {
                    return Center(
                      child: MatchCard(
                        index: i,
                        activeIndex: activeIndex,
                        playOff: liveScores[i],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: AppSizing.kMainPadding(context),
              child: richTitle('Match', context, 25, 'schedule'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomTabBar(
                  changeIndex: changeActiveIndex,
                  titlesList: scheduleItem,
                  selectedIndex: selectedIndex),
            ),
            const SizedBox(height: 10),
            IndexedStack(
              index: selectedIndex,
              children: [
                FinishSchedule(playSchedules: playSchedules),
                PendingSchedule(playSchedules: playSchedules),
                PostponeSchedule(playSchedules: playSchedules)
              ],
            ),
            const SizedBox(height: 100)
          ],
        ),
      ),
    ));
  }
}

class FinishSchedule extends StatelessWidget {
  const FinishSchedule({
    super.key,
    required this.playSchedules,
  });

  final List<PlayOff> playSchedules;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppSizing.kMainPadding(context),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: playSchedules.length,
      separatorBuilder: (c, i) => AppSizing.k10(context),
      itemBuilder: (context, index) {
        return playSchedules[index].status.isCompleted
        ? PlayOffCard(playOff: playSchedules[index]): const SizedBox.shrink();
      },
    );
  }
}

class PendingSchedule extends StatelessWidget {
  const PendingSchedule({
    super.key,
    required this.playSchedules,
  });

  final List<PlayOff> playSchedules;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppSizing.kMainPadding(context),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: playSchedules.length,
      separatorBuilder: (c, i) => AppSizing.k10(context),
      itemBuilder: (context, index) {
        return playSchedules[index].status.isPending
        ? PlayOffCard(playOff: playSchedules[index]): const SizedBox.shrink();
      },
    );
  }
}

class PostponeSchedule extends StatelessWidget {
  const PostponeSchedule({
    super.key,
    required this.playSchedules,
  });

  final List<PlayOff> playSchedules;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppSizing.kMainPadding(context),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: playSchedules.length,
      separatorBuilder: (c, i) => AppSizing.k10(context),
      itemBuilder: (context, index) {
        return playSchedules[index].status.isPostpone 
        ? PlayOffCard(playOff: playSchedules[index]): const SizedBox.shrink();
      },
    );
  }
}

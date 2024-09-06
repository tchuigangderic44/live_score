import 'package:carousel/models/match_history.dart';
import 'package:carousel/models/playoff.dart';
import 'package:carousel/screens/components/card.dart';
import 'package:carousel/screens/components/last_match_widget.dart';
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

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
  }

  List<PlayOff> playOffList = const [
    PlayOff(
        time1Name: 'Cameroon',
        time1Flag: 'assets/images/cameroun.png',
        time2Name: 'Namibie',
        time2Flag: 'assets/images/namibie.png',
        title: 'CAN play-off . Today, 17:00',
        subtitle: 'Group phase. Group J. Day 1 of 6',
        status: 'pending',
        place: 'Omnisport Roumde Adja Stadium'),
    PlayOff(
        time1Name: 'Kenya',
        time1Flag: 'assets/images/kenya.png',
        time2Name: 'Zimbwe',
        time2Flag: 'assets/images/zimbabwe.png',
        title: 'CAN qualifiers . Yesterday',
        subtitle: 'Group phase. Group J. Day 1 of 6',
        status: 'finished',
        place: 'National Mandela Stadium'),
  ];

  List<Transaction> transactions = [
    Transaction(
        title: "Kny 0 : 0 Zbw",
        subtitle: "01 jan 24",
        amount: "06 sept 2024",
        isSend: false),
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
            sectionTitle(
              context: context,
              icon: AppIcons.notification,
              fontSize: 40,
              title: "Live",
              subtitle: "Score",
            ),
            const SizedBox(height: 20),
            Container(
              clipBehavior: Clip.none,
              key: ValueKey(hasZoomed),
              height: AppSizing.height(context) * 0.38,
              child: Center(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: playOffList.length,
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
                        playOff: playOffList[i],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            sectionTitle(
              context: context,
              icon: AppIcons.openTab,
              fontSize: 35,
              title: "Last",
              subtitle: "Match",
            ),
            const SizedBox(height: 10),
            ListView.separated(
              padding: AppSizing.kMainPadding(context),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: transactions.length,
              separatorBuilder: (c, i) => AppSizing.k10(context),
              itemBuilder: (context, index) {
                return TransactionCard(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    ));
  }
}

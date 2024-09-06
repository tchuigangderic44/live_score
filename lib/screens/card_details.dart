import 'package:carousel/models/playoff.dart';
import 'package:carousel/screens/components/circle_btn.dart';
import 'package:carousel/screens/components/match.dart';
import 'package:carousel/screens/components/search_bar.dart';
import 'package:carousel/utils/app_color.dart';
import 'package:carousel/utils/app_icons.dart';
import 'package:carousel/utils/sizing.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  final int index;
  final PlayOff playOff;
  const CardDetails({required this.index, required this.playOff, super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  PageController? pageController;
  int activeIndex = 0;

  @override
  void initState() {
    pageController =
        PageController(initialPage: selectedIndex, viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  final List<String> titlesList = ['Composition', 'Stats', 'Actu'];
  int selectedIndex = 0;

  void changeActiveIndex(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const SizedBox(height: 10),
              playOffAnalyticsView(context, selectedIndex)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox playOffAnalyticsView(BuildContext context, int currentIndex) {
    List<Widget> playOffAnalytics = [
      SizedBox(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(
              Icons.people,
              size: 50,
              color: Colors.grey,
            ),
            const SizedBox(height: 10),
            Text(
              'The composition of the teams will be published before the match',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.blue,
      ),
    ];
    return SizedBox(
      width: AppSizing.width(context),
      height: AppSizing.height(context),
      child: PageView.builder(
        controller: pageController,
        itemCount: titlesList.length,
        onPageChanged: (page) {
          setState(() {
            activeIndex = page;
          });
        },
        itemBuilder: (c, i) {
          return Center(child: playOffAnalytics[currentIndex]);
        },
      ),
    );
  }
}

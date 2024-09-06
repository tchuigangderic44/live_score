import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.titlesList,
    required this.changeIndex,
    required this.selectedIndex,
    super.key,
  });
  final int selectedIndex;
  final List<String> titlesList;
  final Function changeIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < titlesList.length; i++)
              GestureDetector(
                onTap: () => changeIndex(i),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedIndex == i
                        ? Theme.of(context).highlightColor
                        : Colors.grey,
                  ),
                  child: Text(
                    titlesList[i],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: selectedIndex == i
                          ? Colors.white
                          : Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

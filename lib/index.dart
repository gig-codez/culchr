import 'package:culchr/Models/Tools/bottombar_item.dart';
import 'package:culchr/Models/Tools/pallete.dart';
import 'package:culchr/Screens/Home/Home.dart';
import 'package:culchr/Screens/profile/profile.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int activeTab = 0;
  List<IconData> tapIcons = [
    Icons.explore_rounded, //discover page
    Icons.search_rounded, //search page
    Icons.airplane_ticket_rounded, //tickets page
    Icons.person_rounded //profile page
  ];
  List<Widget> pages = [
    const Home(),
    Container(),
    Container(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      floatingActionButton: getBottomBar(),
      body: getBarPage(),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width / 1.1,
      // padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: .5,
                spreadRadius: .5,
                offset: const Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
              tapIcons.length,
              (index) => BottomBarItem(
                    tapIcons[index],
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                  ))),
    );
  }

  Widget getBarPage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: IndexedStack(
          index: activeTab,
          children: List.generate(tapIcons.length, (index) => pages[index])),
    );
  }
}

import 'package:culchr/Screens/Home/Views/All.dart';
import 'package:culchr/Widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'Views/Nearby.dart';
import 'Views/Popular.dart';
import 'Views/Recomended.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentTab = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      animationDuration: const Duration(milliseconds: 600),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          iconSize: 35,
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Culchr.',
          style: TextStyle(
            color: Colors.black,
          ),
          textScaleFactor: 1.5,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              badgeContent: const Text(
                "0",
                style: TextStyle(color: Colors.white),
              ),
              position: BadgePosition.bottomStart(bottom: 8, start: 8),
              child: IconButton(
                iconSize: 30,
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ],
        bottom: TabBar(
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          controller: _tabController,
          isScrollable: true,
          onTap: (index) {
            if (_tabController.index == index) {
              setState(() {
                currentTab = index;
              });
            }
          },
          indicator: const DotIndicator(),
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Popular'),
            Tab(text: 'Nearby'),
            Tab(text: 'Recommended'),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: TabBarView(
            controller: _tabController,
            children: [
              All(),
              Popular(),
              Nearby(),
              const Recommended(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                iconSize: 26,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.home),
              ),
              IconButton(
                iconSize: 26,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                  iconSize: 26,
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mark_chat_unread_rounded,
                  )),
              IconButton(
                iconSize: 26,
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

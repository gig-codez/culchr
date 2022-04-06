import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

import '../Events/EventView.dart';
import 'Models/Tickets.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  final _pageController = PageController(
    viewportFraction: 0.55,
    initialPage: r.length,
  );
  double? _currentEvent = 0.0;
  void scrollMaster() {
    setState(() {
      _currentEvent = _pageController.page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(scrollMaster);
  }

  @override
  void dispose() {
    _pageController.removeListener(scrollMaster);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SwipeDeck(
          startIndex: 0,
          emptyIndicator: Container(
            child: const Center(
              child: Text("Nothing Here"),
            ),
          ),
          cardSpreadInDegrees: 7, // Change the Spread of Background Cards
          onSwipeLeft: () {},
          onSwipeRight: () {},
          onChange: (index) {},
          widgets: List.generate(
            r.length,
            (index) => InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  r[index].image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    reverseTransitionDuration:
                        const Duration(milliseconds: 200),
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        FadeTransition(
                          opacity: animation,
                          child: EventView(
                            image: r[index].image,
                            title: r[index].title,
                            tickets: tickets,
                          ),
                        )),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

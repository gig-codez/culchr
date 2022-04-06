import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:culchr/Screens/Home/Views/Models/Tickets.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

import '../Events/EventView.dart';

class Popular extends StatefulWidget {
  Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final _pageController = PageController(
    viewportFraction: 0.55,
    initialPage: pop.length,
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
            pop.length,
            (index) => InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  pop[index].image,
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
                            image: pop[index].image,
                            title: pop[index].title,
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

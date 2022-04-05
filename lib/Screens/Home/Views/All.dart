import 'package:culchr/Screens/Home/Events/EventView.dart';
import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:culchr/Screens/Home/Views/Models/Tickets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

class All extends StatefulWidget {
  All({Key? key}) : super(key: key);

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final _pageController = PageController(
    viewportFraction: 0.55,
    initialPage: events.length,
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
          onSwipeLeft: () {
            if (kDebugMode) {
              print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
            }
          },
          onSwipeRight: () {
            print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
          },
          onChange: (index) {
            print(events[index].title);
          },
          widgets: List.generate(
            events.length,
            (index) => InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  events[index].image,
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
                            image: events[index].image,
                            title: events[index].title,
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

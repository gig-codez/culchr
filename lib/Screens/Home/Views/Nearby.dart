import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:tcard/tcard.dart';

import '../Events/EventView.dart';
import 'Models/Tickets.dart';

class Nearby extends StatefulWidget {
  Nearby({Key? key}) : super(key: key);

  @override
  State<Nearby> createState() => _NearbyState();
}

class _NearbyState extends State<Nearby> {
  final _pageController = PageController(
    viewportFraction: 0.55,
    initialPage: n.length,
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

  final _cardController = TCardController();
  @override
  Widget build(BuildContext context) {
    Size metrics = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: TCard(
          size: Size(metrics.width, metrics.height / 1.6),
          lockYAxis: false,
          onEnd: () {
            _cardController.reset();
          },
          controller: _cardController, // Change the Spread of Background Cards

          cards: List.generate(
            n.length,
            (index) => InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: metrics.width,
                  height: metrics.height / 1.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(n[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.0),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          bottom: 10,
                          left: 10,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Tap for event details..",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              n[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                            image: n[index].image,
                            title: n[index].title,
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

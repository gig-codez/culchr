import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:culchr/Screens/Home/Views/Models/Tickets.dart';
import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:tcard/tcard.dart';

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

  final _cardController = TCardController();
  @override
  Widget build(BuildContext context) {
    var metrics = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: TCard(
          controller: _cardController,
          onEnd: () {
            _cardController.reset();
          },
          cards: List.generate(
            pop.length,
            (index) => InkWell(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: metrics.width,
                  height: metrics.height / 1.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(pop[index].image),
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
                              pop[index].title,
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

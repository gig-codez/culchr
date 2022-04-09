import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _current = 0;
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var swipes = [
      {
        'heading': "Exclusive Access to every event",
        'image': 'images/events.jpg',
        'content':
            'Be the first to know of your favourite event and get exclusive access to it.'
      },
      {
        'heading': 'Discover experieces  around you',
        'image': 'images/experience.jpg',
        'content':
            'Discover and travel to all the exihilarating experiences around you. ',
      },
      {
        'heading': 'The party doesn’t stop with Nightlife',
        'image': 'images/nightlife.jpg',
        'content':
            'Discover and travel to all the exihilarating experiences around you. ',
      },
      {
        'heading': 'Seamless Entry With CulchrPass',
        'image': 'images/culchrwallet.jpg',
        'content':
            'Updated catalog of concerts, live perfomances taking place in your locality.',
      },
      {
        'heading': 'Cashless pay with our CulchrWallet',
        'image': 'images/culchrpass.jpg',
        'content':
            'Updated catalog of concerts, live perfomances taking place in your locality.'
      }
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              viewportFraction: 1,
              height: MediaQuery.of(context).size.height,
              // aspectRatio: ,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 19),
              autoPlayAnimationDuration: const Duration(milliseconds: 10),
              autoPlayCurve: Curves.decelerate,

              onPageChanged: (index, _) {
                setState(() {
                  _current = index;
                  // print(index);
                });
              },
              scrollDirection: Axis.horizontal,
            ),
            items: List.generate(swipes.length, (index) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.zero,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("${swipes[index]['image']}")),
                    ),
                    child: Container(
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black54,
                            Colors.black26,
                            Colors.transparent
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            Text(
                              "${swipes[index]['heading']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.left,
                              textScaleFactor: 2.1,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "${swipes[index]['content']}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.03,
            left: MediaQuery.of(context).size.width * 0.22,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(swipes.length, (index) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(index),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.black)
                                .withOpacity(_current == index ? 0.9 : 0.4)),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 13,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text(
                      "Create account",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 19,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 13,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text(
                    "or Sign In",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

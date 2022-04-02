import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    var swipes = [
      {
        'heading': "Exclusive Accses to every event",
        'content':
            'Be the first to know of your favourite event and get exclusive access to it.'
      },
      {
        'heading': 'Discover experieces  around you',
        'context':
            'Discover and travel to all the exihilarating experiences around you. ',
      },
      {
        'heading': '',
        'context': '',
      },
      {
        'heading': '',
        'context': '',
      }
    ];
    return Scaffold(
        body: Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,

          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 15),
          autoPlayAnimationDuration: const Duration(milliseconds: 880),
          autoPlayCurve: Curves.decelerate,

          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: swipes.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.white24,
                      ],
                    ),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      // Text(),
                    ],
                  )),
                ),
              );
            },
          );
        }).toList(),
      ),
    ));
  }
}

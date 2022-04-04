import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class EventView extends StatefulWidget {
  final String image;
  final String title;
  const EventView({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: const BackButton(color: Colors.black),
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: GestureDetector(
          onVerticalDragUpdate: ((details) {
            if (details.primaryDelta! < -20) {
              showEventDetails();
            }
          }),
          child: Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.image),
              ),
            ),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black54,
                    Colors.black45,
                    Colors.black12
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        child: BackButton(color: Colors.white),
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  Text(
                    widget.title,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const Text(
                    '3rd September 2022',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Jinja, Uganda',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'TALENT AFRICA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Icon(Icons.star, color: Colors.white)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text(
                    "Swipe up for event details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        onPressed: () {},
        label: const Text("Choose a ticket"),
      ),
    );
  }

  showEventDetails() {
    showCupertinoModalPopup(
        filter: ImageFilter.blur(),
        context: context,
        builder: (context) {
          return BottomSheet(
              backgroundColor: Colors.transparent,
              onClosing: () {},
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 1.23,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: const Center(
                    child: Text("data"),
                  ),
                );
              });
        });
  }
}

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

class _EventViewState extends State<EventView>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _bottomController;
  @override
  void initState() {
    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      animationBehavior: AnimationBehavior.preserve,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: const BackButton(color: Colors.black),
      //   elevation: 0,
      // ),
      body: Builder(builder: (context) {
        return SafeArea(
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0) {
                setState(() {});
                _scaffoldKey.currentState?.reassemble();
                Navigator.of(context).pushNamed('/home');
                setState(() {});
                _scaffoldKey.currentState?.reassemble();
              }
            },
            onVerticalDragUpdate: ((details) {
              if (details.primaryDelta! < 0) {
                showBottomSheet(
                  backgroundColor: Colors.transparent,
                  transitionAnimationController: _bottomController,
                  context: context,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height / 1.18,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: const Center(
                      child: Text("Event Details here"),
                    ),
                  ),
                );
                //showEventDetails();
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: CircleAvatar(
                          child: BackButton(
                            color: Colors.white,
                            onPressed: () {
                              _scaffoldKey.currentState?.reassemble();
                              Navigator.of(context).pushNamed('/home');
                              setState(() {});
                              _scaffoldKey.currentState?.reassemble();
                            },
                          ),
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
        );
      }),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.all(16),
        enableFeedback: true,
        isExtended: true,
        backgroundColor: Colors.orange,
        onPressed: () => showEventDetails(),
        label: const Text("Choose a ticket"),
      ),
    );
  }

  showEventDetails() {
    _scaffoldKey.currentState?.showBottomSheet(
      (context) => Container(
        height: MediaQuery.of(context).size.height / 2.18,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
        child: const Center(
          child: Text("Choose event here"),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  void dispose() {
    _bottomController.dispose();
    _scaffoldKey.currentState?.dispose();
    super.dispose();
  }
}

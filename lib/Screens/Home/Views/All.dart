import 'package:culchr/Screens/Home/Events/EventView.dart';
import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:flutter/material.dart';

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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text('${events[_currentEvent!.toInt()].title}')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Transform.scale(
                scale: 1.6,
                alignment: Alignment.bottomCenter,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  itemCount: events.length,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      const SizedBox.shrink();
                    }
                    var result = _currentEvent! - index + 1;
                    var value = -0.4 * result + 1;
                    var item = events[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            reverseTransitionDuration:
                                const Duration(milliseconds: 200),
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    FadeTransition(
                                      opacity: animation,
                                      child: EventView(
                                        image: item.image,
                                        title: item.title,
                                      ),
                                    )),
                          ),
                        );
                      },
                      child: Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          // ..rotateX(value)
                          ..translate(
                            0.0,
                            MediaQuery.of(context).size.height /
                                2.8 *
                                (1 - value).abs(),
                          )
                          ..scale(value),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(item.image),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

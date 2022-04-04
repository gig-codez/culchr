import 'package:culchr/Screens/Home/Views/Models/Events.dart';
import 'package:flutter/material.dart';

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
            Transform.scale(
              scale: 1.6,
              alignment: Alignment.bottomCenter,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                itemCount: r.length,
                itemBuilder: ((context, index) {
                  if (index == 0) {
                    const SizedBox.shrink();
                  }
                  var result = _currentEvent! - index + 1;
                  var value = -0.4 * result + 1;
                  var item = r[index];
                  return Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 1)
                      ..translate(
                        0.0,
                        MediaQuery.of(context).size.height /
                            2.5 *
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
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

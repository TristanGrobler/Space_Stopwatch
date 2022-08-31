import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space_stopwatch/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late bool autoPlay;
  late IconData playPauseIcon;
  late double _turns;

  CarouselController secCarouselController = CarouselController();
  CarouselController tenSecCarouselController = CarouselController();
  CarouselController minCarouselController = CarouselController();
  CarouselController tenMinCarouselController = CarouselController();
  late AnimationController _animationController;

  @override
  void initState() {
    autoPlay = false;
    playPauseIcon = Icons.play_arrow_outlined;
    _turns = 0;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.gif'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Row(
                  children: [
                    Expanded(
                      child: CarouselSlider(
                        items: Constants.widgets(),
                        carouselController: tenMinCarouselController,
                        options: CarouselOptions(
                          aspectRatio: 9 / 16,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: autoPlay,
                          autoPlayInterval: Duration(seconds: 600),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1200),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        items: Constants.widgets(),
                        carouselController: minCarouselController,
                        options: CarouselOptions(
                          aspectRatio: 9 / 16,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: autoPlay,
                          autoPlayInterval: Duration(seconds: 60),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 900),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(fontSize: 50, color: Color(0xff570081)),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        items: Constants.widgets(),
                        carouselController: tenSecCarouselController,
                        options: CarouselOptions(
                          aspectRatio: 9 / 16,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: autoPlay,
                          autoPlayInterval: Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 600),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        items: Constants.widgets(),
                        carouselController: secCarouselController,
                        options: CarouselOptions(
                          aspectRatio: 9 / 16,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: autoPlay,
                          autoPlayInterval: Duration(seconds: 1),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 300),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Constants.tintColor(),
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 50),
                      child: AnimatedIcon(
                        progress: _animationController,
                        icon: AnimatedIcons.play_pause,
                        size: MediaQuery.of(context).size.width / 25,
                        color: Constants.baseColor(),
                      ),
                    ),
                    onTap: () {
                      autoPlay
                          ? _animationController.reverse()
                          : _animationController.forward();
                      autoPlay = !autoPlay;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 25,
                ),
                Card(
                  color: Constants.tintColor(),
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 50),
                      child: AnimatedRotation(
                        turns: _turns,
                        duration: Duration(milliseconds: 500),
                        child: Icon(
                          Icons.autorenew_outlined,
                          color: Constants.baseColor(),
                          size: MediaQuery.of(context).size.width / 25,
                        ),
                      ),
                    ),
                    onTap: () {
                      autoPlay = false;
                      autoPlay
                          ? _animationController.forward()
                          : _animationController.reverse();
                      secCarouselController.animateToPage(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                      tenSecCarouselController.animateToPage(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                      minCarouselController.animateToPage(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                      tenMinCarouselController.animateToPage(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                      _turns += 1;
                      setState(() {});
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

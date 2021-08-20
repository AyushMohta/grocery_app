import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

int _currentPage = 0;

List<Widget> _pages = [
  Column(
    children: [
      Expanded(child: Image.asset('images/1.jpeg')),
      Text('Set Your Delivery Location', style: kPageViewTextStyle,),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('images/2.jpeg')),
      Text('Order Online from your favourite store', style: kPageViewTextStyle),
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('images/3.jpeg')),
      Text('Quick Delivery to your Doorstep', style: kPageViewTextStyle),
    ],
  )
];

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: _pages,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DotsIndicator(
            dotsCount: _pages.length,
            position: _currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              activeColor: Colors.deepOrangeAccent
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

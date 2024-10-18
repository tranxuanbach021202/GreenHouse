import 'package:flutter/material.dart';
import 'package:greenhouse/resources/color.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              buildIntroPage(
                context,
                'Easily manage your greenhouse',
                'Monitor environmental metrics and crop conditions in real-time, anytime, anywhere',
                'assets/greenhouse_intro1.png',
              ),
              buildIntroPage(
                context,
                'Save time',
                'Automatically record data, eliminating the need for manual input, so you can focus on nurturing your crops',
                'assets/greenhouse_intro1.png',
              ),
              buildIntroPage(
                context,
                'Choose the best option',
                'Easily analyze greenhouse conditions and make timely decisions with detailed reports',
                'assets/greenhouse_intro1.png',
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => buildDot(index == _currentPage)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIntroPage(
      BuildContext context, String title, String description, String imagePath) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3),
          Image.asset(imagePath, height: 200),
          Spacer(flex: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.skyBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Spacer(flex: 1),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget buildDot(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.lightBlueAccent : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
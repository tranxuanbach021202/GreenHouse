import 'package:flutter/material.dart';
import 'package:greenhouse/models/intro_item.dart';
import 'package:greenhouse/resources/color.dart';
import 'package:greenhouse/resources/constant.dart';
import 'package:greenhouse/routes/app_routes.dart';
import 'package:greenhouse/viewmodels/intro_viewmodel.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:provider/provider.dart';
import 'package:greenhouse/resources/constant.dart';

class IntroScreen extends StatelessWidget {

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: viewModel.setCurrentPage,
                itemCount: viewModel.introItems.length,
                itemBuilder: (context, index) {
                  final item = viewModel.introItems[index];
                  return IntroWidget(item: item);
                },
              ),

              // Next/Get Started button
              Positioned(
                bottom: 70,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () => _onButtonPressed(context, viewModel),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mediumSkyBlue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radius6),
                    )
                  ),
                  child: Text(
                    viewModel.currentPage == viewModel.introItems.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style:  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              // Navigation dots
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewModel.introItems.length,
                        (index) => buildDot(
                      context: context,
                      index: index,
                      currentPage: viewModel.currentPage,
                    ),
                  ),
                ),
              ),


            ],
          ),
        );
      },
    );
  }
  Widget buildDot({
    required BuildContext context,
    required int index,
    required int currentPage
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: currentPage == index ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColor.mediumSkyBlue
            : AppColor.bubBles,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  void _onButtonPressed(BuildContext context, IntroViewModel viewModel) async {
    if (viewModel.currentPage == viewModel.introItems.length - 1) {
      // Last page - complete intro
      await viewModel.completeIntro();
      Navigator.pushReplacementNamed(context, AppRoutes.signup);
    } else {
      // Go to next page
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}




// Wiget page intro
class IntroWidget extends StatelessWidget {
  final IntroItem item;

  const IntroWidget({
    Key? key,
    required this.item,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.image, height: 200),
          SizedBox(height: 30,),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.skyBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          // Spacer(flex: 1),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width - 40,
          //   child: ElevatedButton(
          //     onPressed: () {
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.lightBlueAccent,
          //       padding: EdgeInsets.symmetric(vertical: 15),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8.0),
          //       ),
          //     ),
          //     child: Text(
          //       'GET STARTED',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          //
          // SizedBox(height: 20),
          // Spacer(flex: 1),
        ],
      ),
    );
  }
}

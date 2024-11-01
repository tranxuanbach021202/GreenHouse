import 'package:flutter/material.dart';
import 'package:greenhouse/models/intro_item.dart';
import 'package:greenhouse/resources/assets.dart';
import 'package:greenhouse/resources/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroViewModel extends ChangeNotifier {
  int _currentPage = 0;
  final int _totalPages = 3;

  int get currentPage => _currentPage;

  bool get isLastPage => _currentPage == _totalPages -1;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  Future<void> completeIntro() async {
    // Lưu trạng thái đã xem intro
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }



  final List<IntroItem> introItems = [
    IntroItem(
      title: AppStrings.introTitle1,
      description: AppStrings.description1,
      image: AppAssets.intro1),
    IntroItem(
        title: AppStrings.introTitle2,
        description: AppStrings.description2,
        image: AppAssets.intro2),
    IntroItem(
        title: AppStrings.introTitle3,
        description: AppStrings.description3,
        image: AppAssets.intro2),
  ];


}


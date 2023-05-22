import 'dart:ui';

import 'package:mini_project/core/colors.dart';

class OnBoardingContents {
  final Color color;
  final String image;
  final String desc1;
  final String desc2;

  OnBoardingContents(
      {required this.image, required this.desc1, required this.desc2, required this.color});
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    color: onBoardingColorBeige,
      image: 'lib/core/assets/images/onboarding1.png',
      desc1: 'Learn New',
      desc2: 'Things every day'),
  OnBoardingContents(
      color: onBoardingColorBlue,
      image: 'lib/core/assets/images/onboarding2.png',
      desc1: 'Transform Your',
      desc2: 'Knowledge into Expertise'),
  OnBoardingContents(
      color: onBoardingColorBeige,
      image: 'lib/core/assets/images/onboarding3.png',
      desc1: 'Build your',
      desc2: 'skills to the next level'),
];

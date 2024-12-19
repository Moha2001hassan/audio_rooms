import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  final PageController controller;

  const OnboardingDotNavigation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 25,
      child: SmoothPageIndicator(
        controller: controller,
        count: 2,
        effect: const ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: Colors.blue,
          dotColor: Colors.white,
        ),
      ),
    );
  }
}

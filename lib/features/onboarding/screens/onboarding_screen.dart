import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rivy/core/constants/assets.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/dimensions.dart';
import 'package:rivy/core/widgets/annotated_status_bar.dart';
import 'package:rivy/core/widgets/app_button.dart';
import 'package:rivy/features/onboarding/models/onboarding_item.dart';
import 'package:rivy/features/onboarding/widgets/carousel.dart';
import 'package:rivy/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Color> _backgroundColors = [
    Colors.purple.shade50,
    Colors.lightBlue.shade50,
    Colors.yellow.shade50,
    Colors.green.shade50,
  ];

  int _currentIndex = 0;
  final _pageController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedStatusBar(
      color: Colors.white,
      brightness: Brightness.light,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColors[_currentIndex],
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Center(
                            child: AnimatedSmoothIndicator(
                              count: _onboardingItems.length,
                              activeIndex: _currentIndex,
                              onDotClicked: _onDotClicked,
                              effect: ExpandingDotsEffect(
                                dotWidth: constraints.maxWidth * 0.15,
                                dotHeight: 5,
                                spacing: Dimensions.space2,
                                dotColor: AppColor.grey2,
                                activeDotColor: Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: OCarousel(
                          currentIndex: _currentIndex,
                          onboardingItems: _onboardingItems,
                          pageController: _pageController,
                          onPageChanged: _onPageChanged,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(text: context.l10n.next, onTap: _onNextPage),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: AppButton(
                          isOnlyBorder: true,
                          text: context.l10n.skip,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<OnBoardingItem> get _onboardingItems => [
        OnBoardingItem(
          img: ImageAssets.one,
          title: context.l10n.financeForHomeTitle,
          subTitle: context.l10n.financeForHomeDescription,
        ),
        OnBoardingItem(
          img: ImageAssets.two,
          title: context.l10n.buyProductsTitle,
          subTitle: context.l10n.buyProductsDescription,
        ),
        OnBoardingItem(
          img: ImageAssets.three,
          title: context.l10n.makeMoneySolarTitle,
          subTitle: context.l10n.makeMoneySolarDescription,
        ),
        OnBoardingItem(
          img: ImageAssets.four,
          title: context.l10n.financeCommunitiesTitle,
          subTitle: context.l10n.financeCommunitiesDescription,
        ),
      ];

  void _onDotClicked(int index) {
    _pageController.animateToPage(index, curve: Curves.easeIn);
  }

  void _onNextPage() {
    _pageController.nextPage();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

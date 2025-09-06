import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivy/core/constants/app_style.dart';
import 'package:rivy/core/constants/assets.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/dimensions.dart';
import 'package:rivy/core/utilities/extensions/scroll_physics_extension.dart';
import 'package:rivy/core/utilities/size/size_config.dart';
import 'package:rivy/core/widgets/annotated_status_bar.dart';
import 'package:rivy/core/widgets/app_button.dart';
import 'package:rivy/features/onboarding/domain/bloc.dart';
import 'package:rivy/features/onboarding/models/onboarding_item.dart';
import 'package:rivy/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = CarouselSliderController();
  int currentIndex = 0;

  List<Color> backgroundColors = [
    Colors.purple.shade50,
    Colors.lightBlue.shade50,
    Colors.yellow.shade50,
    Colors.green.shade50,
  ];

  List<OnBoardingItem> get onboardingItems => [
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

  void onDotClicked(int index) {
    pageController.animateToPage(index, curve: Curves.easeIn);
  }

  void onNextPage() {
    pageController.nextPage();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedStatusBar(
      color: Colors.white,
      brightness: Brightness.light,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: backgroundColors[currentIndex],
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                // Scrollable area: indicator + carousel
                Expanded(
                  child: Column(
                    children: [
                      // Page indicator
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Center(
                            child: AnimatedSmoothIndicator(
                              count: onboardingItems.length,
                              activeIndex: currentIndex,
                              onDotClicked: onDotClicked,
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
                      // Carousel
                      Expanded(
                        child: OCarousel(
                          currentIndex: currentIndex,
                          onboardingItems: onboardingItems,
                          pageController: pageController,
                          onPageChanged: onPageChanged,
                        ),
                      ),
                    ],
                  ),
                ),

                // Buttons pinned at bottom
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppButton(text: context.l10n.next, onTap: onNextPage),
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
}

class OCarousel extends StatefulWidget {
  final int currentIndex;
  final List<OnBoardingItem> onboardingItems;
  final CarouselSliderController pageController;
  final Function(int)? onPageChanged;

  const OCarousel({
    super.key,
    required this.currentIndex,
    required this.onboardingItems,
    required this.pageController,
    this.onPageChanged,
  });

  @override
  State<OCarousel> createState() => _OCarouselState();
}

class _OCarouselState extends State<OCarousel> {
  @override
  void didChangeDependencies() {
    // Preload images to avoid flicker
    for (var item in widget.onboardingItems) {
      precacheImage(AssetImage(item.img), context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    double heightFactor;
    if (SizeConfig.screenHeight! < 600) {
      heightFactor = 0.6;
    } else if (SizeConfig.screenHeight! < 750) {
      heightFactor = 0.63;
    } else {
      heightFactor = 0.66;
    }

    return CarouselSlider(
      carouselController: widget.pageController,
      options: CarouselOptions(
        initialPage: widget.currentIndex,
        aspectRatio: 16 / 9,
        height: SizeConfig.screenHeight! * heightFactor,
        viewportFraction: 1,
        autoPlay: true,
        disableCenter: true,
        onPageChanged: (index, _) {
          bloc.add(OnboardingPageChanged(index));
          if (widget.onPageChanged != null) widget.onPageChanged!(index);
        },
      ),
      items: widget.onboardingItems.map((item) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.img,
              width: double.infinity,
              height: SizeConfig.screenHeight! < 600
                  ? SizeConfig.screenHeight! * 0.32
                  : SizeConfig.screenHeight! < 750
                      ? SizeConfig.screenHeight! * 0.42
                      : SizeConfig.screenHeight! * 0.45,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.space4,
                vertical: SizeConfig.screenHeight! < 600
                    ? Dimensions.space2
                    : SizeConfig.screenHeight! < 900
                        ? Dimensions.space3
                        : Dimensions.space4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    item.title,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SizeConfig.screenHeight! < 600
                        ? TextStyles.headlineSmall.bold
                        : SizeConfig.screenHeight! < 750
                            ? TextStyles.headlineMedium.bold
                            : TextStyles.headlineLarge.bold,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! < 600
                        ? Dimensions.space2
                        : SizeConfig.screenHeight! < 790
                            ? Dimensions.space3
                            : Dimensions.space4,
                  ),
                  // Subtitle (increased size)
                  Text(
                    item.subTitle,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: SizeConfig.screenHeight! < 600
                        ? TextStyles.titleLarge.apply(color: AppColor.grey)
                        : TextStyles.titleLarger.apply(color: AppColor.grey),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

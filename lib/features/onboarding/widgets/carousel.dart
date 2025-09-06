import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivy/core/constants/app_style.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/dimensions.dart';
import 'package:rivy/core/utilities/size/size_config.dart';
import 'package:rivy/features/onboarding/domain/onboarding_bloc.dart';
import 'package:rivy/features/onboarding/domain/onboarding_event.dart';
import 'package:rivy/features/onboarding/models/onboarding_item.dart';

class OCarousel extends StatefulWidget {
  final void Function(int)? onPageChanged;
  final int currentIndex;
  final List<OnBoardingItem> onboardingItems;
  final CarouselSliderController pageController;

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

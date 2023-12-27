import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Core/Constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/Core/Constants/dummy_videos_links.dart';

class MovieBanner extends StatefulWidget {
  const MovieBanner({super.key});

  @override
  State<MovieBanner> createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBanner> {
  int currentActiveSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
        
        ),
        child: LayoutBuilder(builder: (context, constrains) {
          return Stack(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayCurve: Curves.linear,
                  pauseAutoPlayInFiniteScroll: true,
                  aspectRatio: 6,
                  height: constrains.maxHeight - 20,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentActiveSlider = index;
                    });
                  },
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                ),
                itemCount: MoiveBanners.getMovieBanners.length,
                itemBuilder: (context, index, realIndex) {
                  return Focus(
                      focusNode: new FocusNode(canRequestFocus: true),
                      child: Container(
                        width: constrains.maxWidth - 50,
                        margin:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: AppColors.whiteColor, width: 1),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              MoiveBanners.getMovieBanners[index],
                            ),
                          ),
                        ),
                      ));
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSmoothIndicator(
                  curve: Curves.easeIn,
                  effect: SlideEffect(
                    activeDotColor: AppColors.activeColor,
                    dotWidth: 20,
                    dotColor: AppColors.whiteColor,
                    dotHeight: 10,
                    radius: 20,
                    spacing: 10,
                  ),
                  activeIndex: currentActiveSlider,
                  count: MoiveBanners.getMovieBanners.length,
                ),
              )
            ],
          );
        }));
  }
}

import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/asset_path.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<Map<String, String>> testimonials = [
    {
      "quote":
          "CarsBlog helped me choose my first car with confidence. The reviews are practical, honest, and easy to understand even for beginners.",
      "name": "Jonathan Vallem",
      "location": "New York, USA",
      "image": AssetPath.heroImg,
    },
    {
      "quote":
          "I regularly follow their car comparisons before making buying decisions. The real-world driving insights are what set this blog apart.",
      "name": "Ahmed Khan",
      "location": "Lahore, Pakistan",
      "image": AssetPath.heroImg,
    },
    {
      "quote":
          "The technology and EV articles are well-researched and explained in simple terms. Perfect for someone transitioning to electric cars.",
      "name": "Sarah Mitchell",
      "location": "London, UK",
      "image": AssetPath.heroImg,
    },
    {
      "quote":
          "From maintenance tips to detailed reviews, CarsBlog feels like advice from a knowledgeable friend rather than marketing content.",
      "name": "Daniel Costa",
      "location": "Toronto, Canada",
      "image": AssetPath.heroImg,
    },
  ];

  late PageController _pageController;
  int _currentIndex = 0;
  void updateIndex(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return Container(
      constraints: BoxConstraints(minHeight: isMobile ? 330 : 300),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 16
            : isTablet
            ? 32
            : 32,
        vertical: 32,
      ),
      width: MediaQuery.widthOf(context),
      color: AppColors.darkBlue,

      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Textview(
                        text: 'TESTIMONIALS',
                        color: AppColors.whiteColor,
                      ),

                      SizedBox(height: 10),
                      Textview(
                        text: 'Trusted by car enthusiasts worldwide',
                        isBold: true,
                        size: 24,
                        color: AppColors.whiteColor,
                      ),
                      SizedBox(height: 10),

                      Text(
                        'Real feedback from readers who rely on CarsBlog for honest reviews, comparisons, and buying advice.',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 0.5),
                SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) => updateIndex(value),
                    scrollDirection: Axis.horizontal,
                    itemCount: testimonials.length,

                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ), // inside padding ONLY
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Textview(
                            text: testimonials[index]["quote"]!,
                            color: AppColors.whiteColor,
                            size: 14,
                            isBold: true,
                          ),
                          SizedBox(height: 10),
                          // Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage(
                                  testimonials[index]["image"]!,
                                ),
                              ),

                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textview(
                                    text: testimonials[index]["name"]!,
                                    isBold: true,
                                    color: AppColors.whiteColor,
                                  ),
                                  Textview(
                                    text: testimonials[index]["location"]!,
                                    isBold: false,
                                    size: 14,
                                    color: AppColors.whiteColor,
                                  ),
                                ],
                              ),

                              Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                    iconSize: 32,
                                    onPressed: _currentIndex > 0
                                        ? () {
                                            _pageController.previousPage(
                                              duration: Duration(
                                                milliseconds: 500,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        : null,
                                    icon: Icon(
                                      Icons.arrow_circle_left,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),

                                  IconButton(
                                    iconSize: 32,
                                    onPressed:
                                        _currentIndex < testimonials.length - 1
                                        ? () {
                                            _pageController.nextPage(
                                              duration: Duration(
                                                milliseconds: 500,
                                              ),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        : null,

                                    icon: Icon(
                                      Icons.arrow_circle_right,
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Textview(
                          text: 'TESTIMONIALS',
                          color: AppColors.whiteColor,
                        ),

                        SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.widthOf(context) * 0.20,

                          child: Textview(
                            text: 'Trusted by car enthusiasts worldwide',
                            isBold: true,
                            size: 24,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 10),

                        Text(
                          'Real feedback from readers who rely on CarsBlog for honest reviews, comparisons, and buying advice.',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(thickness: 0.5),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.widthOf(context) * 0.02,
                    ),
                    child: SizedBox(
                      height: isTablet ? 250 : 200,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) => updateIndex(value),
                        scrollDirection: Axis.horizontal,
                        itemCount: testimonials.length,

                        itemBuilder: (context, index) => SizedBox(
                          width: MediaQuery.widthOf(context) * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              SizedBox(
                                width: isTablet ? 500 : 500,
                                child: Textview(
                                  text: testimonials[index]["quote"]!,
                                  color: AppColors.whiteColor,
                                  size: 24,
                                  isBold: true,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: double.infinity,

                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage(
                                        testimonials[index]["image"]!,
                                      ),
                                    ),

                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Textview(
                                          text: testimonials[index]["name"]!,
                                          isBold: true,
                                          color: AppColors.whiteColor,
                                        ),
                                        Textview(
                                          text:
                                              testimonials[index]["location"]!,
                                          isBold: false,
                                          size: 14,
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    ),

                                    Spacer(),
                                    Row(
                                      children: [
                                        IconButton(
                                          iconSize: 32,
                                          onPressed: _currentIndex > 0
                                              ? () {
                                                  _pageController.previousPage(
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.easeInOut,
                                                  );
                                                }
                                              : null,
                                          icon: Icon(
                                            Icons.arrow_circle_left,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),

                                        IconButton(
                                          iconSize: 32,
                                          onPressed:
                                              _currentIndex <
                                                  testimonials.length - 1
                                              ? () {
                                                  _pageController.nextPage(
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    curve: Curves.easeInOut,
                                                  );
                                                }
                                              : null,

                                          icon: Icon(
                                            Icons.arrow_circle_right,
                                            color: AppColors.redColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

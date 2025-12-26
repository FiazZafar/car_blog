import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/app_routes.dart';
import 'package:car_blog/widgets/asset_path.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class AllPosts extends StatelessWidget {
  const AllPosts({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32.0,
            left: 16,
            right: 32,
            bottom: 16,
          ),
          child: Textview(text: 'All Posts', size: 24, isBold: true),
        ),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssetPath.heroImg,
                        width: width ,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: isMobile ? width : MediaQuery.widthOf(context) * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textview(
                              text:
                                  'A Review of Cars with Advanced Infotainment Systems',
                              size: 24,
                              isBold: true,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AssetPath.heroImg),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Textview(
                                      text: 'Dasteen',
                                      size: 11,
                                      isBold: true,
                                    ),
                                    Row(
                                      children: [
                                        Textview(
                                          text: 'Jan 10, 2024 ∙ 3 min read',
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Textview(
                              text:
                                  'Lorem ipsum dolor sit amet consectetur. Consectetur risus quis diam hendrerit. Interdum mattis in sed diam egestas metus at duis commodo. Cursus quis cursus dignissim egestas sollicitudin tristique quis. Orci neque quis porttitor eu amet. ommodo. Cursus quis cursus dignissim egestas sollicitudin tristique quis. Orci neque quis porttitor eu amet.',
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.redColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.carsPage,
                                  ),
                                  child: Textview(
                                    text: "Read more",
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AssetPath.heroImg,
                        width: isTablet ? 350 : 450,
                        height: isTablet ? 350 : 250,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.widthOf(context) * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textview(
                              text:
                                  'A Review of Cars with Advanced Infotainment Systems',
                              size: 24,
                              isBold: true,
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AssetPath.heroImg),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Textview(
                                      text: 'Dasteen',
                                      size: 11,
                                      isBold: true,
                                    ),
                                    Row(
                                      children: [
                                        Textview(
                                          text: 'Jan 10, 2024 ∙ 3 min read',
                                          size: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Textview(
                              text:
                                  'Lorem ipsum dolor sit amet consectetur. Consectetur risus quis diam hendrerit. Interdum mattis in sed diam egestas metus at duis commodo. Cursus quis cursus dignissim egestas sollicitudin tristique quis. Orci neque quis porttitor eu amet. ommodo. Cursus quis cursus dignissim egestas sollicitudin tristique quis. Orci neque quis porttitor eu amet.',
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.redColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.carsPage,
                                  ),
                                  child: Textview(
                                    text: "Read more",
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}

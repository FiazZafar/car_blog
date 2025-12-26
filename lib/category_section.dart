import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/app_routes.dart';
import 'package:car_blog/widgets/asset_path.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});
  final List<Map<String, String>> categories = [
    {
      "title": "Car Reviews",
      "desc": "Honest reviews based on real driving experience.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Electric Vehicles",
      "desc": "EV news, charging, range tests, and buying tips.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Maintenance Tips",
      "desc": "Keep your car reliable with simple maintenance advice.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "New Technology",
      "desc": "Infotainment, ADAS, and smart car innovations.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Car Comparisons",
      "desc": "Side-by-side comparisons to help you decide.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Buying Guides",
      "desc": "What to check before buying your next car.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Safety",
      "desc": "Airbags, ratings, and modern safety systems.",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Performance",
      "desc": "Engines, handling, and driving dynamics explained.",
      "image": AssetPath.heroImg,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return Container(
      height: isMobile
          ? 300
          : isTablet
          ? 330
          : 340,
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Textview(text: 'All Category', isBold: true, size: 24),
              Spacer(),
              InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.blogPage),
                child: Textview(text: 'see all', isBold: false, size: 16),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: isMobile
                ? 200
                : isTablet
                ? 220
                : 230,
            child: ListView.builder(
              itemCount: categories.length,

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.blogPage),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: isMobile ? 180 : isTablet ? 170 : 170,

                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    border: Border.all(color: AppColors.redColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        height: isMobile ? 50 : isTablet ? 65 : 80,
                        
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(categories[index]["image"]!),

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Textview(
                        text: categories[index]["title"]!,

                        isBold: true,
                        size: 16,
                      ),
                      Textview(
                        text: categories[index]["desc"]!,
                        size: 14,
                        textAlign: TextAlign.center,
                        isBold: false,
                      ),

                      SizedBox(height: 10),
                    ],
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

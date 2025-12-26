import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/app_routes.dart';
import 'package:car_blog/widgets/asset_path.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class ItemsSection extends StatelessWidget {
  ItemsSection({super.key});
  final List<Map<String, String>> techItems = [
    {
      "title": "Inside Modern Cars with Advanced Infotainment Systems",
      "author": "Auto Tech Desk",
      "date": "Jan 10, 2024",
      "readTime": "3 min read",
      "image": AssetPath.heroImg,
    },
    {
      "title": "How ADAS is Making Cars Safer Than Ever",
      "author": "Fiaz Zafar",
      "date": "Jan 08, 2024",
      "readTime": "4 min read",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Electric Vehicle Tech Explained for Beginners",
      "author": "EV Guide",
      "date": "Jan 05, 2024",
      "readTime": "5 min read",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Connected Cars: How Smart Features Change Driving",
      "author": "Auto Future",
      "date": "Jan 02, 2024",
      "readTime": "3 min read",
      "image": AssetPath.heroImg,
    },
    {
      "title": "Digital Instrument Clusters: Worth the Hype?",
      "author": "Car Lab",
      "date": "Dec 29, 2023",
      "readTime": "2 min read",
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
        children: [
          Row(
            children: [
              Textview(text: 'New Technology', isBold: true, size: 24),
              Spacer(),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.blogPage),
                child: Textview(text: 'see all', isBold: false, size: 16),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: isMobile
                ? 250
                : isTablet
                ? 280
                : 280,
            child: ListView.builder(
              itemCount: techItems.length,

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.carsPage),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: isMobile ? 180 : isTablet ? 250 : 250,

                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    border: Border.all(color: AppColors.redColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          height: isMobile
                              ? 120
                              : isTablet
                              ? 170
                              : 170,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(techItems[index]["image"]!),

                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Textview(
                        text: techItems[index]["title"]!,
                        isBold: true,
                        size: 13,
                      ),

                      Spacer(),
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
                                text: techItems[index]["author"]!,
                                size: 11,
                                isBold: true,
                              ),
                              Textview(
                                text:
                                    '${techItems[index]["date"]} ∙ ${techItems[index]["readTime"]}',
                                size: 10,
                              ),
                            ],
                          ),
                        ],
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

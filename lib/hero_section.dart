import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/asset_path.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return 
    Container(
      
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 16
            : isTablet
            ? 32
            : 48,
        vertical: 48,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.heroImg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          SizedBox(
            width: isMobile ? double.infinity : 420,
            child: Textview(
              text: 'Real Cars. Real Reviews. Real Driving.',
              size: isMobile
                  ? 24
                  : isTablet
                  ? 32
                  : 48,
              color: AppColors.whiteColor,
              isBold: true,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: isMobile ? double.infinity : 420,
            child: Textview(
              text:
                  'Discover in-depth car reviews, latest launches, buying guides, and real-world driving insights. From daily commuters to performance machines, we help you choose the right car with confidence.',
              size: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 15),
      
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Textview(
                      text: "Subscribe",
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.send, color: AppColors.whiteColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:car_blog/widgets/asset_path.dart';
import 'package:flutter/material.dart';

class CarsHeroSection extends StatelessWidget {
  const CarsHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 16
            : isTablet
            ? 32
            : 48,
        vertical: 48,
      ),
      height: isMobile ? 300 : 400,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.heroImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

import 'package:car_blog/all_posts.dart';
import 'package:car_blog/blog_footer.dart';
import 'package:car_blog/blog_hero_section.dart';
import 'package:car_blog/footer_section.dart';
import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class AllBlogs extends StatelessWidget {
  const AllBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 22,
          fill: 0.2,
          color: AppColors.offWhite,
        ),
        title: Textview(
          text: 'Blogs Page',
          size: 22,
          color: AppColors.whiteColor,
        ),
        backgroundColor: AppColors.darkBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlogHeroSection(),
              AllPosts(),
              BlogFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

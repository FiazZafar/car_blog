import 'package:car_blog/widgets/app_colors.dart';
import 'package:car_blog/widgets/static_data.dart';
import 'package:car_blog/widgets/textview.dart';
import 'package:flutter/material.dart';

class BlogSection extends StatefulWidget {
  const BlogSection({super.key});

  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  int _position = 0;
  bool isReadMore = true;
  void updateIndex(int index) {
    setState(() {
      _position = index;
    });
  }

  void updateReadMore() {
    setState(() {
      isReadMore = !isReadMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.widthOf(context);
    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;
    return Container(
     
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile
            ? 16
            : isTablet
            ? 32
            : 48,
        vertical: 48,
      ),
      child: isMobile
          ? 
          Column(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Textview(
                            text: 'Trending Blogs',
                            color: AppColors.darkBlue,
                            size: 24,
                            isBold: true,
                          ),
                          Spacer(),
                          Textview(
                            text: 'See all',
                            color: AppColors.blackColor,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: StaticData.blogs.length,

                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => updateIndex(index),
                            child: Container(
                              color: index == _position
                                  ? AppColors.redColor
                                  : AppColors.whiteColor,
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8,
                              ),
                              margin: EdgeInsets.symmetric(
                                // vertical: 16,
                                horizontal: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'By',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: index == _position
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' John Doe',

                                          style: TextStyle(
                                            fontSize: 16,
                                            color: index == _position
                                                ? AppColors.whiteColor
                                                : AppColors.redColor,
                                            fontWeight: index == _position
                                                ? FontWeight.w700
                                                : FontWeight.w300,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' | March 12, 2024',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: index == _position
                                                ? AppColors.whiteColor
                                                : AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Textview(
                                    text: StaticData.blogs[index]["title"]!,
                                    size: 16,
                                    isBold: true,
                                    color: index == _position
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textview(
                            text: 'Latest Review',
                            color: AppColors.darkBlue,
                            size: 24,
                            isBold: true,
                          ),
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              StaticData.blogs[_position]["image"]!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: 'By ',
                              children: [
                                TextSpan(
                                  text: StaticData.blogs[_position]["author"]!,
                                  style: TextStyle(color: AppColors.redColor),
                                ),
                                TextSpan(
                                  text:
                                      ' | ${StaticData.blogs[_position]["date"]}',
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5),

                          Textview(
                            text: StaticData.blogs[_position]["title"]!,
                            isBold: true,
                          ),

                          SizedBox(
                            child: Text(
                              isReadMore
                                  ? StaticData.blogs[_position]["excerpt"]!
                                  : StaticData.blogs[_position]["content"]!,
                            ),
                          ),

                          InkWell(
                            onTap: () => updateReadMore(),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              width: 150,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isReadMore
                                    ? AppColors.redColor
                                    : AppColors.darkBlue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Textview(
                                      text: isReadMore
                                          ? "Read more"
                                          : "Show less",
                                      color: AppColors.whiteColor,
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.send,
                                      color: AppColors.whiteColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textview(
                        text: 'Latest Review',
                        color: AppColors.darkBlue,
                        size: 24,
                        isBold: true,
                      ),
                  
                      Image.asset(
                        StaticData.blogs[_position]["image"]!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                  
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: 'By ',
                          children: [
                            TextSpan(
                              text: StaticData.blogs[_position]["author"]!,
                              style: TextStyle(color: AppColors.redColor),
                            ),
                            TextSpan(
                              text: ' | ${StaticData.blogs[_position]["date"]}',
                            ),
                          ],
                        ),
                      ),
                  
                      SizedBox(height: 5),
                  
                      Textview(
                        text: StaticData.blogs[_position]["title"]!,
                        isBold: true,
                      ),
                  
                      SizedBox(
                        width: MediaQuery.widthOf(context) * 0.45,
                        child: Text(
                          isReadMore
                              ? StaticData.blogs[_position]["excerpt"]!
                              : StaticData.blogs[_position]["content"]!,
                        ),
                      ),
                  
                      InkWell(
                        onTap: () => updateReadMore(),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          width: 150,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isReadMore
                                ? AppColors.redColor
                                : AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Textview(
                                  text: isReadMore ? "Read more" : "Show less",
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.send, color: AppColors.whiteColor),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Textview(
                            text: 'Trending Blogs',
                            color: AppColors.darkBlue,
                            size: 24,
                            isBold: true,
                          ),
                                    
                          Spacer(),
                          Textview(
                            text: 'See all',
                            color: AppColors.blackColor,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: isTablet ? MediaQuery.heightOf(context) * 0.4 : MediaQuery.heightOf(context) * 0.7,
                        child: ListView.builder(
                          itemCount: StaticData.blogs.length,
                                    
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => updateIndex(index),
                            child: Container(
                              color: index == _position
                                  ? AppColors.redColor
                                  : AppColors.whiteColor,
                              padding: EdgeInsets.symmetric(
                                vertical: 24,
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: 'By',
                                      style: TextStyle(
                                        color: index == _position
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' John Doe',
                                    
                                          style: TextStyle(
                                            color: index == _position
                                                ? AppColors.whiteColor
                                                : AppColors.redColor,
                                            fontWeight: index == _position
                                                ? FontWeight.w700
                                                : FontWeight.w300,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' | March 12, 2024',
                                          style: TextStyle(
                                            color: index == _position
                                                ? AppColors.whiteColor
                                                : AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Textview(
                                    text: StaticData.blogs[index]["title"]!,
                                    size: 18,
                                    isBold: true,
                                    color: index == _position
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
